"
I represent a pragma as a ̀FinderResult̀.
"
Class {
	#name : 'StFinderPragmaResult',
	#superclass : 'StFinderResult',
	#category : 'NewTools-Finder-Result',
	#package : 'NewTools-Finder',
	#tag : 'Result'
}

{ #category : 'testing' }
StFinderPragmaResult class >> matches: anObject [ 

	^ anObject hasPragma
]

{ #category : 'displaying' }
StFinderPragmaResult >> displayIcon [

	^ self iconNamed: #changeUpdate
]

{ #category : 'private' }
StFinderPragmaResult >> forFinderPreview: aSpCodePresenter [ 

	self parent
		ifNil: [ aSpCodePresenter text: 'Please select a method expanding the selected item' ]
		ifNotNil: [ 
			self 
				displaySource: (self content >> self parent content) 
				in: aSpCodePresenter ]
]

{ #category : 'testing' }
StFinderPragmaResult >> isPragmaResult [

	^ true
]

{ #category : 'accessing' }
StFinderPragmaResult >> resultPreview [
	"Private - See superimplementor's comment"

	^ self shouldBeImplemented 
]
