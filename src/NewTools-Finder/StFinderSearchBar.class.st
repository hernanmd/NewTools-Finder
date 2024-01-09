"
I am a widget for the ̀Finder̀ tool. I contain all widgets regarding the search bar.
"
Class {
	#name : 'StFinderSearchBar',
	#superclass : 'SpPresenter',
	#instVars : [
		'searchInput',
		'searchButton',
		'searchModeDropList'
	],
	#category : 'NewTools-Finder-Widgets',
	#package : 'NewTools-Finder',
	#tag : 'Widgets'
}

{ #category : 'layout' }
StFinderSearchBar >> defaultLayout [

	^ SpBoxLayout newLeftToRight
			spacing: 2;
			add: searchModeDropList expand: false;
			add: searchInput;
			add: searchButton;
			yourself
]

{ #category : 'initialization' }
StFinderSearchBar >> initializePresenters [

	searchModeDropList := self newDropList
		help: 'Select the type of elements to search for';
		display: [ :search | search name ];
		whenSelectedItemChangedDo: [ : modeType | 
			self 
				updateSearchOptions: modeType;
				updatePreview: modeType ];
		yourself.

	searchInput := self newSearchInput
		               placeholder: self placeHolderText;
		               yourself.
	searchButton := self newButton 
		label: 'Search';
		icon: (self iconNamed: #smallFind);
		action: [ self searchBy: searchInput text ];
		yourself.

		
	self focusOrder add: searchInput.
]

{ #category : 'initialization' }
StFinderSearchBar >> placeHolderText [

	| modeText |
	modeText :=  searchModeDropList selectedItem 
		ifNotNil: [ : sm | sm name ]
		ifNil: [ String empty ].
	^ String streamContents: [ : stream |
			stream
				<< 'Search ';
				<< modeText asLowercase;
				<< '... Hit return to accept' ]
]

{ #category : 'accessing' }
StFinderSearchBar >> searchButton [

	^ searchButton
]

{ #category : 'searching' }
StFinderSearchBar >> searchBy: aString [ 

	owner model searchBy: aString
]

{ #category : 'accessing' }
StFinderSearchBar >> searchInput [

	^ searchInput
]

{ #category : 'updating - widgets' }
StFinderSearchBar >> searchMode [
	"Answer a <StFinderSearch> with the currently selected search mode"
	
	^ searchModeDropList selectedItem
]

{ #category : 'accessing' }
StFinderSearchBar >> searchModeDropList [

	^ searchModeDropList
]

{ #category : 'updating - widgets' }
StFinderSearchBar >> searchModes: aListOfSearches [

	searchModeDropList items: aListOfSearches
]

{ #category : 'accessing' }
StFinderSearchBar >> searchText [
	"Answer a <String> with the current text to search"

	^ searchInput text
]

{ #category : 'initialization' }
StFinderSearchBar >> updatePlaceHolder: modeType [
	
	searchInput placeholder: modeType name
]

{ #category : 'updating - widgets' }
StFinderSearchBar >> updatePreview: aStFinderSelectorSearch [ 
	"Private - Search mode changed, update the valid search options for the selected aStFinderSelectorSearch"

	owner updatePreview: aStFinderSelectorSearch

]

{ #category : 'updating - widgets' }
StFinderSearchBar >> updateSearchModes [

	searchModeDropList items: self owner model availableSearches
]

{ #category : 'updating - widgets' }
StFinderSearchBar >> updateSearchOptions: aStFinderSelectorSearch [ 
	"Private - Search mode changed, update the valid search options for the selected aStFinderSelectorSearch"

	owner updateSearchOptions: aStFinderSelectorSearch validSearchOptions

]

{ #category : 'events' }
StFinderSearchBar >> whenSearchModeChangedDo: aOneArgumentBlock [
	"aOneArgumentBlock gets the new search mode passed as the argument."

	searchModeDropList whenSelectedItemChangedDo: aOneArgumentBlock
]

{ #category : 'events' }
StFinderSearchBar >> whenSubmitSearchDo: aOneArgumentBlock [
	"aOneArgumentBlock gets the search text passed as the argument."

	searchInput whenSubmitDo: aOneArgumentBlock
]
