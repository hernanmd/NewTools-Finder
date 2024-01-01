"
I represent a class as a ̀FinderResult̀.
"
Class {
	#name : 'StFinderTraitResult',
	#superclass : 'StFinderClassResult',
	#category : 'NewTools-Finder-Result',
	#package : 'NewTools-Finder',
	#tag : 'Result'
}

{ #category : 'testing' }
StFinderTraitResult class >> matches: aCompiledMethod [ 
	"Answer <true> if aCompiledMethod comes from a trait"
	
	^ aCompiledMethod methodClass isTrait
]

{ #category : 'action' }
StFinderTraitResult >> browseAction [
	"Opens the system browser on its content. If it has a `StFinderSelectorResult` as a parent,
	then opens the system browser on its content with the selector from its parent focused."

	self hasSelectorParent
		ifTrue: [
			self browser
				openOnClass: self content innerClass
				selector: self parent content ]
		ifFalse: [ content browse ]
]

{ #category : 'accessing' }
StFinderTraitResult >> content: aCompiledMethod [

	content := aCompiledMethod traitSource
		ifNil: [ aCompiledMethod methodClass ]
		ifNotNil: [ aCompiledMethod traitSource ]

]

{ #category : 'displaying' }
StFinderTraitResult >> displayIcon [

	^ self iconNamed: #trait
]

{ #category : 'action' }
StFinderTraitResult >> forFinderPreview: aSpCodePresenter [

	^ self parent
		  ifNotNil: [ self displaySource: self getContentSource in: aSpCodePresenter ]
		  ifNil: [
			  aSpCodePresenter
				  beForScripting;
				  text: self content definitionString ]
]
