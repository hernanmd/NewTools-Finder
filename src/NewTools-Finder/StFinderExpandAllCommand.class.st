"
Command to open a settings browser focused on the Finder settings.
"
Class {
	#name : 'StFinderExpandAllCommand',
	#superclass : 'StFinderCommand',
	#category : 'NewTools-Finder-Commands',
	#package : 'NewTools-Finder',
	#tag : 'Commands'
}

{ #category : 'default' }
StFinderExpandAllCommand class >> defaultDescription [

	^ 'Command to open a settings browser focused on the Finder settings.'
]

{ #category : 'default' }
StFinderExpandAllCommand class >> defaultIconName [

	^ #configuration
]

{ #category : 'default' }
StFinderExpandAllCommand class >> defaultName [ 

	^ 'Expand all'
]

{ #category : 'default' }
StFinderExpandAllCommand class >> defaultShortcut [

	^ $f meta, $o meta
]

{ #category : 'executing' }
StFinderExpandAllCommand >> execute [

	self halt.
]
