Class {
	#name : 'StFinderSettings',
	#superclass : 'Object',
	#classVars : [
		'EvaluationTimeout'
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
