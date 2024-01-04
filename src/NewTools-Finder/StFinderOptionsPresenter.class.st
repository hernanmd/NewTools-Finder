"
Presents a window to set more advanced search options.

"
Class {
	#name : 'StFinderOptionsPresenter',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'excludeTests',
		'ignoreComments',
		'useCompletion',
		'searchAsYouType',
		'toolbar'
	],
	#category : 'NewTools-Finder-Core',
	#package : 'NewTools-Finder',
	#tag : 'Core'
}

{ #category : 'layout' }
StFinderOptionsPresenter >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom 
		spacing: 3;	
		add: excludeTests expand: false;
		add: ignoreComments expand: false;
		add: useCompletion  expand: false;
		add: searchAsYouType  expand: false;
		add: toolbar expand: false;
		yourself
]

{ #category : 'initialization' }
StFinderOptionsPresenter >> initialExtentForWindow [

	^ 550 @ 500
]

{ #category : 'initialization' }
StFinderOptionsPresenter >> initializePresenters [

	excludeTests := self newCheckBox 
		label: 'Exclude tests';
		help: 'Exclude test methods in results';
		state: false;
		yourself.

	ignoreComments := self newCheckBox
		label: 'Ignore comments';
		help: 'Do not search in comments';
		state: true;
		yourself.
	
	useCompletion := self newCheckBox
		label: 'Use completion';
		help: 'Autocomplete suggestions as you type in search field';
		state: false;
		yourself.
		
	searchAsYouType := self newCheckBox
		label: 'Search as you type';
		help: 'Update results as you type in the search field';
		state: false;
		yourself.
		
	self initializeToolbar
]

{ #category : 'initialization' }
StFinderOptionsPresenter >> initializeToolbar [

	toolbar := self newButtonBar 
		add: (self newButton
			label: 'Cancel';
			action: [ self delete ];
			yourself);
		add: (self newButton
			label: 'Save';
			help: 'Save search options';
			action: [ self saveSearchOptions ];
			yourself);
		yourself
]

{ #category : 'initialization' }
StFinderOptionsPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.

	self setTitleTo: aSpWindowPresenter.
	self setWindowIconTo: aSpWindowPresenter.
	self setInitialExtentTo: aSpWindowPresenter
]

{ #category : 'initialization' }
StFinderOptionsPresenter >> setInitialExtentTo: aSpWindowPresenter [
	
	aSpWindowPresenter initialExtent: self initialExtentForWindow
]

{ #category : 'initialization' }
StFinderOptionsPresenter >> setTitleTo: aSpWindowPresenter [

	aSpWindowPresenter title: 'Search Options'
]

{ #category : 'initialization' }
StFinderOptionsPresenter >> setWindowIconTo: aSpWindowPresenter [
	
	aSpWindowPresenter	windowIcon: (self iconNamed: #config).

]
