Class {
	#name : 'StFinderListingCommand',
	#superclass : 'StFinderCommand',
	#category : 'NewTools-Finder-Commands',
	#package : 'NewTools-Finder',
	#tag : 'Commands'
}

{ #category : 'testing' }
StFinderListingCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self context searchMode isFinderExampleSearch not ]

]
