"
It wraps a `StMethodFinderSend`
"
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

{ #category : 'displaying' }
StFinderExampleResult >> displayString [

	^ self content selector
]

{ #category : 'private' }
StFinderExampleResult >> forFinderPreview: aSpCodePresenter [ 

	^ String empty
]

{ #category : 'instance creation' }
StFinderExampleResult >> getCompiledMethodFrom: aStFinderSelectorResult [ 

	^ self content receiver class lookupSelector: self content selector
]

{ #category : 'private' }
StFinderExampleResult >> selectItemIn: aSpTreePresenter [ 


]
