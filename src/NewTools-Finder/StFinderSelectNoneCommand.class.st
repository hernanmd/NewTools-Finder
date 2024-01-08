Class {
	#name : 'StFinderSelectNoneCommand',
	#superclass : 'StFinderCommand',
	#category : 'NewTools-Finder-Commands',
	#package : 'NewTools-Finder',
	#tag : 'Commands'
}

{ #category : 'default' }
StFinderSelectNoneCommand class >> defaultDescription [

	^ 'Unselect all results'
]

{ #category : 'initialization' }
StFinderSelectNoneCommand class >> defaultIconName [

	^ #checkboxUnselected
]

{ #category : 'default' }
StFinderSelectNoneCommand class >> defaultName [

	^ 'Select None'
]

{ #category : 'executing' }
StFinderSelectNoneCommand >> execute [
	"Select all uninstalled result items"

	self context selectedResults: Set empty.
	self resultsTable refresh
]
