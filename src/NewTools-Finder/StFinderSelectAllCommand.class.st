Class {
	#name : 'StFinderSelectAllCommand',
	#superclass : 'StFinderCommand',
	#category : 'NewTools-Finder-Commands',
	#package : 'NewTools-Finder',
	#tag : 'Commands'
}

{ #category : 'default' }
StFinderSelectAllCommand class >> defaultDescription [

	^ 'Command to select all result on the Finder settings.'
]

{ #category : 'initialization' }
StFinderSelectAllCommand class >> defaultIconName [

	^ #checkedBox
]

{ #category : 'default' }
StFinderSelectAllCommand class >> defaultName [

	^ 'Select All'
]

{ #category : 'executing' }
StFinderSelectAllCommand >> execute [
	"Select all uninstalled result items"

	self context selectedResults: self resultItems.
	self resultsTable refresh
]
