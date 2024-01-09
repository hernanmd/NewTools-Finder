"
I represent a class as a ̀FinderResult̀.
"
Class {
	#name : 'StFinderClassResult',
	#superclass : 'StFinderResult',
	#category : 'NewTools-Finder-Result',
	#package : 'NewTools-Finder',
	#tag : 'Result'
}

{ #category : 'testing' }
StFinderClassResult class >> matches: aCompiledMethod [ 
	"Answer <true> if aClassOraTaCompositionElement is a <Class>"
	
	^ aCompiledMethod methodClass isClass
]

{ #category : 'action' }
StFinderClassResult >> browseAction [
	"Opens the system browser on its content. If it has a `StFinderSelectorResult` as a parent,
	then opens the system browser on its content with the selector from its parent focused."

	self hasSelectorParent
		ifTrue: [
			self browser
				openOnClass: self content
				selector: self parent content ]
		ifFalse: [ content browse ]
]

{ #category : 'accessing' }
StFinderClassResult >> content: aCompiledMethodOrClass [

	content := aCompiledMethodOrClass isCompiledMethod 
		ifTrue: [  aCompiledMethodOrClass methodClass ]
		ifFalse: [ aCompiledMethodOrClass ]
]

{ #category : 'copying' }
StFinderClassResult >> copyTo: aWriteStream [ 

	aWriteStream << self content name.
	self hasSelectorParent
		ifTrue: [ 
			aWriteStream
				<< '>>#';
				<< self parent content ]
]

{ #category : 'displaying' }
StFinderClassResult >> displayIcon [

	(self content inheritsFrom: Exception) ifTrue: [ ^ self iconNamed: #exception ].
	self content isAbstract ifTrue: [ ^ self iconNamed: #classAbstract ].
	self content isDeprecated ifTrue: [ ^ self iconNamed: #smallNew ].
	self content isObsolete ifTrue: [ ^ self iconNamed: #error ].
	^ self iconNamed: #class
]

{ #category : 'action' }
StFinderClassResult >> forFinderPreview: aSpCodePresenter [ 

	^ (self content isClass and: [ self parent notNil and: [ self parent isPackageResult not ] ])
		ifTrue: [ 
			self 
				displaySource: self getCompiledMethod
				in: aSpCodePresenter ]
		ifFalse: [ 
			aSpCodePresenter 
				beForScripting;
				text: self content definitionString ]
]

{ #category : 'accessing' }
StFinderClassResult >> getCompiledMethod [
	"Answer a <CompiledMethod> representing the currently found content"

	^ self parent content isCompiledMethod
		ifTrue: [ self parent content ]
		ifFalse: [ self content >> self parent content ]
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> hasBrowseAction [

	^ true
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> hasHierarchyAction [

	^ true
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> hasInheritanceAction [

	^ self hasSelectorParent
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> hasSelectorParent [

	^ self parent notNil and: [ self parent isSelectorResult ]
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> hasVersionsAction [

	^ self hasSelectorParent
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> hierarchyAction [

	self hasSelectorParent ifTrue: [
		self navigation
			browseHierarchy: content
			selector: self parent content.
		^ self ].

	self navigation browseHierarchy: content
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> inheritanceAction [

	self hasInheritanceAction ifFalse: [ ^ self ].
	self systemNavigation
		methodHierarchyBrowserForClass: self content
		selector: self parent content
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> isClassOrTrait: aClassOraTaCompositionElement [ 
	"Answer <true> if aClassOraTaCompositionElement is a <Class> or has a trait"
	
	^ aClassOraTaCompositionElement isClass or: [ aClassOraTaCompositionElement traits notEmpty ]
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> isClassResult [

	^ true
]

{ #category : 'action' }
StFinderClassResult >> referencesAction [

	self navigation browseAllUsersOfClassOrTrait: self content
]

{ #category : 'as yet unclassified' }
StFinderClassResult >> versionsAction [

	self hasVersionsAction ifFalse: [ ^ self ].

	self versionBrowser
		browseVersionsForClass: self content
		selector: self parent content
]
