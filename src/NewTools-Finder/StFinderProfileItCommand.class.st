"
Command to debug a resulting expression from the Examples search mode in the Finder tool

"
Class {
	#name : 'StFinderProfileItCommand',
	#superclass : 'StFinderExecutionCommand',
	#category : 'NewTools-Finder-Commands',
	#package : 'NewTools-Finder',
	#tag : 'Commands'
}

{ #category : 'default' }
StFinderProfileItCommand class >> defaultDescription [

	^ 'Profile the selected example'
]

{ #category : 'initialization' }
StFinderProfileItCommand class >> defaultIconName [

	^ #smallProfile
]

{ #category : 'default' }
StFinderProfileItCommand class >> defaultName [ 

	^ 'Profile It'
]

{ #category : 'initialization' }
StFinderProfileItCommand class >> defaultShortcut [

	^ $p meta
]

{ #category : 'as yet unclassified' }
StFinderProfileItCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedItems ~= 0 and: [ self selectedItem isExampleResult ] ]
]

{ #category : 'executing' }
StFinderProfileItCommand >> execute [
	"Debug the selected example result"

	self selectedItem content profile

]
