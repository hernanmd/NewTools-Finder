Class {
	#name : 'StFinderExampleTest',
	#superclass : 'StFinderTest',
	#category : 'NewTools-Finder-Tests',
	#package : 'NewTools-Finder-Tests'
}

{ #category : 'running' }
StFinderExampleTest >> setUp [

	super setUp.
	presenterModel currentSearch: StFinderExampleSearch new.
	self openInstance.
	
]
