Class {
	#name : 'StFinderExampleResult',
	#superclass : 'StFinderResult',
	#category : 'NewTools-Finder-Result',
	#package : 'NewTools-Finder',
	#tag : 'Result'
}

{ #category : 'testing' }
StFinderExampleResult class >> matches: aCollection [ 

	^ false
]

{ #category : 'displaying' }
StFinderExampleResult >> displayIcon [

	^ self iconNamed: #page
]

{ #category : 'private' }
StFinderExampleResult >> forFinderPreview: aSpCodePresenter [

	self halt.
	^ self parent
		  ifNotNil: [ self displaySource: self getContentSource in: aSpCodePresenter ]
		  ifNil: [
			  aSpCodePresenter
				  beForScripting;
				  text: self content definitionString ]
]
