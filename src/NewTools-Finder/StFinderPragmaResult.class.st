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

{ #category : 'displaying' }
StFinderPragmaResult >> displayIcon [

	^ self iconNamed: #changeUpdate
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
