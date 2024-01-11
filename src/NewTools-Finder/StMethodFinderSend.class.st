"
Extends `MethodFinderSend` to support Finder UI operations for searching examples.

- Timeout execution.
- Logging errors.

"
Class {
	#name : 'StMethodFinderSend',
	#superclass : 'MethodFinderSend',
	#category : 'NewTools-Finder-Search',
	#package : 'NewTools-Finder',
	#tag : 'Search'
}

{ #category : 'accessing' }
StMethodFinderSend >> children [
	^ Array empty
]

{ #category : 'copying' }
StMethodFinderSend >> copyTo: aWriteStream [ 

	aWriteStream << self selector
]

{ #category : 'accessing' }
StMethodFinderSend >> displayIcon [

	^ self iconNamed: #page
]

{ #category : 'accessing' }
StMethodFinderSend >> evaluateWithTimeOut: anInteger [ 

	| runner result |

	runner := TKTLocalProcessTaskRunner new.
	runner 
		schedule: [ 
			result := [ self evaluate ] onErrorDo: [ : e | self handleError: e ] ] asTask
		timeout: anInteger milliSeconds.
	^ result

]

{ #category : 'accessing' }
StMethodFinderSend >> forFinderPreview: aSpCodePresenter [ 

	self flag: #toRemove.
	aSpCodePresenter 
		beForScripting;
		text: self previewText
]

{ #category : 'accessing' }
StMethodFinderSend >> handleError: e [

	StFinderSettings logErrorsToTranscript
		ifTrue: [ (self logInfo: e) traceCr ].
	StFinderSettings logErrorsToFile
		ifTrue: [ StFinderSettings logErrorFileReference 
			writeStreamDo: [ : stream | stream nextPutAll: (self logInfo: e) ] ].

]

{ #category : 'accessing' }
StMethodFinderSend >> hasBrowseAction [

	^ false
]

{ #category : 'testing' }
StMethodFinderSend >> hasChildren [

	^ false
]

{ #category : 'accessing' }
StMethodFinderSend >> hasHierarchyAction [

	^ false
]

{ #category : 'accessing' }
StMethodFinderSend >> hasImplementersAction [

	^ true
]

{ #category : 'accessing' }
StMethodFinderSend >> hasInheritanceAction [

	^ false
]

{ #category : 'accessing' }
StMethodFinderSend >> hasSendersAction [

	^ true
]

{ #category : 'accessing' }
StMethodFinderSend >> hasVersionsAction [

	^ false
]

{ #category : 'accessing' }
StMethodFinderSend >> implementersAction [

	SystemNavigation default browseAllImplementorsOf: self selector
]

{ #category : 'testing' }
StMethodFinderSend >> isClassResult [

	^ false
]

{ #category : 'testing' }
StMethodFinderSend >> isSelectorResult [

	^ true
]

{ #category : 'accessing' }
StMethodFinderSend >> logInfo: e [
	"Answer a <String> representing the error e to be logged"
	
	^ String streamContents: [ : stream |
		stream
			<< e class name;
			<< '[';
			<< e messageText;
			<< ']';
			space.
			self printOn: stream ]
]

{ #category : 'testing' }
StMethodFinderSend >> matches: aString [ 

	^ false
]

{ #category : 'accessing' }
StMethodFinderSend >> previewText [

	self flag: #toRemove.
	^ StFinderPresenter methodFinderExplanation
]

{ #category : 'accessing' }
StMethodFinderSend >> resultIn: expectedResult timeout: anInteger [

	[ [ ^ expectedResult = (self evaluateWithTimeOut: anInteger) ]
		onErrorDo: [ :anError | ^ false ] ]
			on: Deprecation
			do: [ :depr | ^ false ]
]

{ #category : 'accessing' }
StMethodFinderSend >> sendersAction [

	self flag: #review. "StFinderSelectorResult>>sendersAction"
	SystemNavigation default
		browseSendersOf: self selector
		name: 'Senders of ' , self selector
		autoSelect: self selector
]
