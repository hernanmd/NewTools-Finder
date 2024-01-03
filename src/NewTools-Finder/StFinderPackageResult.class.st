Class {
	#name : 'StFinderPackageResult',
	#superclass : 'StFinderResult',
	#category : 'NewTools-Finder-Result',
	#package : 'NewTools-Finder',
	#tag : 'Result'
}

{ #category : 'displaying' }
StFinderPackageResult >> displayIcon [

	^ self iconNamed: #package
]

{ #category : 'private' }
StFinderPackageResult >> forFinderPreview: aSpCodePresenter [ 

	^ String empty
]
