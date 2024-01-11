Class {
	#name : 'StFinderDebugItCommand',
	#superclass : 'StFinderCommand',
	#category : 'NewTools-Finder-Commands',
	#package : 'NewTools-Finder',
	#tag : 'Commands'
}

{ #category : 'default' }
StFinderDebugItCommand class >> defaultDescription [

	^ 'Debug the selected example'
]

{ #category : 'initialization' }
StFinderDebugItCommand class >> defaultIconName [

	^ #smallDebugIt
]

{ #category : 'default' }
StFinderDebugItCommand class >> defaultName [ 

	^ 'Debug selection'
]

{ #category : 'initialization' }
StFinderDebugItCommand class >> defaultShortcut [

	^ $d meta
]

{ #category : 'testing' }
StFinderDebugItCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedItems ~= 0 and: [ self selectedItem isExampleResult ] ]
]

{ #category : 'executing' }
StFinderDebugItCommand >> execute [
	"Debug the selected example result"

	self selectedItem debugIt

]
