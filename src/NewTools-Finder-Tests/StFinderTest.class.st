Class {
	#name : 'StFinderTest',
	#superclass : 'TestCase',
	#instVars : [
		'application',
		'presenter',
		'presenterModel'
	],
	#category : 'NewTools-Finder-Tests',
	#package : 'NewTools-Finder-Tests'
}

{ #category : 'running' }
StFinderTest >> classToTest [

	^ StFinderPresenter
]

{ #category : 'running' }
StFinderTest >> finderPackagesForTests [

	^ #('NewTools-Finder-Tests')
]

{ #category : 'running' }
StFinderTest >> openInstance [

	presenter open.
	presenter window initialPosition: 1 @ 1.
]

{ #category : 'running' }
StFinderTest >> setUp [
	super setUp.

	presenter := self classToTest basicNew. 
	presenter setModelBeforeInitialization: StFinderModel new.
	presenter 
		application: StPharoApplication new;
		initialize;
		searchInPackages: self finderPackagesForTests.
	presenterModel := presenter model.
]

{ #category : 'running' }
StFinderTest >> tearDown [

	presenter withWindowDo: [ :window | window close ].
	super tearDown
]
