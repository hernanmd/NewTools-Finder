Class {
	#name : 'StFinderCopySelectionCommand',
	#superclass : 'StFinderCommand',
	#category : 'NewTools-Finder-Commands',
	#package : 'NewTools-Finder',
	#tag : 'Commands'
}

{ #category : 'default' }
StFinderCopySelectionCommand class >> defaultDescription [

	^ 'Command copy the selected results'
]

{ #category : 'initialization' }
StFinderCopySelectionCommand class >> defaultIconName [

	^ #smallCopy
]

{ #category : 'default' }
StFinderCopySelectionCommand class >> defaultName [ 

	^ 'Copy selection'
]

{ #category : 'initialization' }
StFinderCopySelectionCommand class >> defaultShortcut [

	^ $f meta, $c meta
]
