"
I implement a search for selectors in a given environment.

I am a subclass of ̀FinderSearch̀ and am used by ̀FinderModel̀ to perform searches
for selectors.

"
Class {
	#name : 'StFinderSelectorSearch',
	#superclass : 'StFinderSearch',
	#category : 'NewTools-Finder-Search',
	#package : 'NewTools-Finder',
	#tag : 'Search'
}

{ #category : 'private' }
StFinderSelectorSearch >> buildResult: aListOfMethods [

	| results |
	results := OrderedCollection new.

	aListOfMethods do: [ :method |
		| foundResult |

		foundResult := StFinderResult newFor: method.
		results
			detect: [ :elem | elem content = method selector ]
			ifFound: [ :elem | elem addChild: foundResult ]
			ifNone: [
				| newResult |
				newResult := StFinderSelectorResult new
					             content: method selector;
					             addChild: foundResult;
					             yourself.
				results add: newResult ] ].

	^ results
]

{ #category : 'information' }
StFinderSelectorSearch >> name [
	"Returns the name of the search."

	^ 'Selectors'
]

{ #category : 'searching' }
StFinderSelectorSearch >> searchByRegex: aString in: anEnvironment [
	"Perform a search given aRegex in anEnvironment."

	| regex |
	regex := aString asRegex.
	^ self buildResult: 
		(self 
			searchMethods: [ :method | regex search: method selector asString ] 
			in: anEnvironment)
]

{ #category : 'accessing' }
StFinderSelectorSearch >> searchByStringExactInsensitiveCase: aString in: aRBBrowserEnvironment [ 

	^ self buildResult: (self 
		searchMethods: [ :method | method selector asLowercase = aString asLowercase ] 
		in: aRBBrowserEnvironment)
]

{ #category : 'accessing' }
StFinderSelectorSearch >> searchByStringExactSensitiveCase: aString in: aRBBrowserEnvironment [ 

	^ self buildResult: (self 
		searchMethods: [ :method | method selector = aString ] 
		in: aRBBrowserEnvironment)
]

{ #category : 'accessing' }
StFinderSelectorSearch >> searchByStringSensitiveCase: aString in: aRBBrowserEnvironment [ 

	^ self buildResult: (self 
		searchMethods: [ :method | method selector includesSubstring: aString caseSensitive: true ] 
		in: aRBBrowserEnvironment)
]

{ #category : 'searching' }
StFinderSelectorSearch >> searchBySubstring: aString in: anEnvironment [
	"Perform a search given aString in anEnvironment."

	^ self buildResult: (self 
		searchMethods: [ :method | method selector includesSubstring: aString caseSensitive: false ] 
		in: anEnvironment)
]

{ #category : 'private' }
StFinderSelectorSearch >> searchMethods: aSelectBlock in: anEnvironment [

	^ OrderedCollection streamContents: [ :stream |
		  anEnvironment classesAndTraitsDo: [ :class |
			  class methodsDo: [ :method |
				  (aSelectBlock value: method) ifTrue: [ stream nextPut: method ] ].
			  class classSide methodsDo: [ :method |
				  (aSelectBlock value: method) ifTrue: [ stream nextPut: method ] ] ] ]
]
