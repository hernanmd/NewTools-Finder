"
I represent a selector as a ̀FinderResult̀.
"
Class {
	#name : 'StFinderSelectorResult',
	#superclass : 'StFinderResult',
	#category : 'NewTools-Finder-Result',
	#package : 'NewTools-Finder',
	#tag : 'Result'
}

{ #category : 'testing' }
StFinderSelectorResult class >> matches: anObject [ 

	^ false
]

{ #category : 'action' }
StFinderSelectorResult >> browseAction [

	self hasBrowseAction ifFalse: [ ^ self ].

	self browser
		openOnClass: self parent content
		selector: self content
]

{ #category : 'displaying' }
StFinderSelectorResult >> displayIcon [

	^ self iconNamed: #book
]

{ #category : 'private' }
StFinderSelectorResult >> forFinderPreview: aSpCodePresenter [ 

	self parent
		ifNil: [ 
			aSpCodePresenter 
				beForScripting;
				text: 'Please select a method implementation expanding the selected item' ]
		ifNotNil: [ 
			self 
				displaySource: self getCompiledMethod
				in: aSpCodePresenter ]
]

{ #category : 'accessing' }
StFinderSelectorResult >> getCompiledMethod [
	"Answer a <CompiledMethod> representing the currently found content"

	^ self parent content >> self content
]

{ #category : 'testing' }
StFinderSelectorResult >> hasBrowseAction [

	^ self hasClassParent
]

{ #category : 'testing' }
StFinderSelectorResult >> hasClassParent [

	^ self parent notNil and: [ self parent isClassResult ]
]

{ #category : 'testing' }
StFinderSelectorResult >> hasHierarchyAction [

	^ self hasClassParent
]

{ #category : 'testing' }
StFinderSelectorResult >> hasImplementersAction [

	^ true
]

{ #category : 'testing' }
StFinderSelectorResult >> hasInheritanceAction [

	^ self hasClassParent
]

{ #category : 'testing' }
StFinderSelectorResult >> hasSendersAction [

	^ true
]

{ #category : 'testing' }
StFinderSelectorResult >> hasVersionsAction [

	^ self parent notNil and: [ self parent isClassResult ]
]

{ #category : 'action' }
StFinderSelectorResult >> hierarchyAction [

	self hasHierarchyAction ifFalse: [ ^ self ].

	self navigation
		browseHierarchy: self parent content
		selector: self content
]

{ #category : 'action' }
StFinderSelectorResult >> implementersAction [

	self navigation browseAllImplementorsOf: content
]

{ #category : 'action' }
StFinderSelectorResult >> inheritanceAction [

	self hasInheritanceAction ifFalse: [ ^ self ].

	self navigation
		methodHierarchyBrowserForClass: self parent content
		selector: self content
]

{ #category : 'testing' }
StFinderSelectorResult >> isSelectorResult [

	^ true
]

{ #category : 'action' }
StFinderSelectorResult >> sendersAction [

	self navigation
		browseSendersOf: content
		name: 'Senders of ' , content asString
		autoSelect: content asString
]

{ #category : 'action' }
StFinderSelectorResult >> versionsAction [

	self versionBrowser
		browseVersionsForClass: self parent content
		selector: self content
]
