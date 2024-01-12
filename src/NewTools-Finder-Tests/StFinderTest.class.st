Class {
	#name : 'StFinderTest',
	#superclass : 'TestCase',
	#instVars : [
		'backendForTest',
		'application',
		'presenter'
	],
	#category : 'NewTools-Finder-Tests',
	#package : 'NewTools-Finder-Tests'
}

{ #category : 'running' }
StFinderTest >> classToTest [

	^ StFinderPresenter
]

{ #category : 'running' }
StFinderTest >> initializeInstanceBeforeInitialization: aPresenter [
	| model context |

	model := StFinderModel new.
	context := StInspectionContext fromPragma: (StInspectorMockObject>>#inspectionMock1) pragmas first.
	context inspectedObject: model inspectedObject.
	aPresenter setModelBeforeInitialization: (self classToTest on: model) 
]

{ #category : 'running' }
StFinderTest >> openInstance [

	presenter open
]

{ #category : 'running' }
StFinderTest >> setUp [
	super setUp.
	
	backendForTest := SpMorphicBackendForTest new.
	application := StPharoApplication new.
			
	presenter := self classToTest basicNew. 
	self initializeInstanceBeforeInitialization: presenter.
	presenter application: application.
	presenter initialize.
	self initializeInstance: presenter
]

{ #category : 'running' }
StFinderTest >> tearDown [

	presenter withWindowDo: [ :window | window close ].
	super tearDown
]
