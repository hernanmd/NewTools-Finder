"
Command to open a settings browser focused on the Finder settings.
"
Class {
	#name : 'StFinderSettingsCommand',
	#superclass : 'StFinderCommand',
	#category : 'NewTools-Finder-Commands',
	#package : 'NewTools-Finder',
	#tag : 'Commands'
}

{ #category : 'default' }
StFinderSettingsCommand class >> defaultDescription [

	^ 'Command to open a settings browser focused on the Finder settings.'
]

{ #category : 'default' }
StFinderSettingsCommand class >> defaultIconName [

	^ #configuration
]

{ #category : 'default' }
StFinderSettingsCommand class >> defaultName [ 

	^'Finder Settings'
]

{ #category : 'default' }
StFinderSettingsCommand class >> defaultShortcut [

	^ $f meta, $o meta
]

{ #category : 'executing' }
StFinderSettingsCommand >> execute [

	SettingBrowser new
		rootNodes: (SettingBrowser currentTree nodeNamed: #finder) allChildren;
		open
]
