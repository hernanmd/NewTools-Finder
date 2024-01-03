"
I implement a search for in the source in a given environment.

I am a subclass of ̀StFinderSelectorSearch̀ and am used by ̀StFinderModel̀ to perform searches
for selectors.

"
Class {
	#name : 'StFinderSourceSearch',
	#superclass : 'StFinderSelectorSearch',
	#category : 'NewTools-Finder-Search',
	#package : 'NewTools-Finder',
	#tag : 'Search'
}

{ #category : 'information' }
StFinderSourceSearch >> name [
	"Returns the name of the search."

	^ 'Source'
]

{ #category : 'searching' }
StFinderSourceSearch >> searchByRegex: aString in: anEnvironment [
	"Perform a search given aRegex in anEnvironment."

	| regex |
	regex := aString asRegex.
	^ self buildResult: (self
			   searchMethods: [ :method | regex search: method sourceCode ]
			   in: anEnvironment)
]

{ #category : 'accessing' }
StFinderSourceSearch >> searchByStringExactInsensitiveCase: aString in: aRBBrowserEnvironment [ 

	^ self buildResult: (self 
		searchMethods: [ :method | method sourceCode asLowercase = aString asLowercase ] 
		in: aRBBrowserEnvironment)
]

{ #category : 'accessing' }
StFinderSourceSearch >> searchByStringExactSensitiveCase: aString in: aRBBrowserEnvironment [ 

	^ self buildResult: (self 
		searchMethods: [ :method | method sourceCode = aString ] 
		in: aRBBrowserEnvironment)
]

{ #category : 'accessing' }
StFinderSourceSearch >> searchByStringSensitiveCase: aString in: aRBBrowserEnvironment [ 

	^ self buildResult: (self 
		searchMethods: [ :method | method sourceCode includesSubstring: aString caseSensitive: true ] 
		in: aRBBrowserEnvironment)
]

{ #category : 'searching' }
StFinderSourceSearch >> searchBySubstring: aString in: anEnvironment [
	"Perform a search given aString in anEnvironment."

	^ self buildResult: (self
	   searchMethods: [ :method | method sourceCode includesSubstring: aString caseSensitive: false ]
	   in: anEnvironment)
]
