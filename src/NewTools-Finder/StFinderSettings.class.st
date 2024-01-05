Class {
	#name : 'StFinderSettings',
	#superclass : 'Object',
	#classVars : [
		'EvaluationTimeout',
		'LogErrorFile',
		'LogErrorsToFile',
		'LogErrorsToTranscript'
	],
	#category : 'NewTools-Finder-Core',
	#package : 'NewTools-Finder',
	#tag : 'Core'
}

{ #category : 'system settings' }
StFinderSettings class >> evaluationTimeout [
	"Modified by settings Finder: self classSide >> #evaluationTimeoutOn:"

	^ EvaluationTimeout
		ifNil: [ EvaluationTimeout := 50 ]
]

{ #category : 'system settings' }
StFinderSettings class >> evaluationTimeoutOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #evaluationTimeout)
		parent: #finder;
		default: 50;
		label: 'Evaluation timeout';
		description: 'Maximum timeout delay for individual calls in Examples search. Expects an integer giving the number of miliseconds';
		target: self
]

{ #category : 'system settings' }
StFinderSettings class >> groupSettingsOn: aBuilder [
	<systemsettings>

	(aBuilder group: #finder)
		label: 'Finder';
		description: '';
		parent: #tools
]

{ #category : 'system settings' }
StFinderSettings class >> logErrorFile [
	"Modified by settings Finder: self classSide >> #logErrorsToTranscriptOn:"

	^ LogErrorFile
		ifNil: [ LogErrorFile := '' ]
]

{ #category : 'system settings' }
StFinderSettings class >> logErrorFileReference [
	"Answer a <FileReference> used to log evaluation errors"

	^ self logErrorFile asFileReference
]

{ #category : 'system settings' }
StFinderSettings class >> logErrorsToFile [
	"Answer <true> if the receiver should log errors to a file"

	^ self logErrorFile notEmpty
]

{ #category : 'system settings' }
StFinderSettings class >> logErrorsToFileOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #logErrorsToFile)
		parent: #finder;
		default: true;
		label: 'Log errors to file';
		description: 'Log evaluation errors in the examples search to a file';
		target: self
]

{ #category : 'system settings' }
StFinderSettings class >> logErrorsToTranscript [
	"Modified by settings Finder: self classSide >> #logErrorsToTranscriptOn:"

	^ LogErrorsToTranscript
		ifNil: [ LogErrorsToTranscript := true ]
]

{ #category : 'system settings' }
StFinderSettings class >> logErrorsToTranscriptOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #logErrorsToTranscript)
		parent: #finder;
		default: true;
		label: 'Log errors to Transcript';
		description: 'Log evaluation errors in the examples search to the Transcript';
		target: self
]
