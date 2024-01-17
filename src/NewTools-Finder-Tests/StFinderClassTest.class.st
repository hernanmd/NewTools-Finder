Class {
	#name : 'StFinderClassTest',
	#superclass : 'StFinderTest',
	#category : 'NewTools-Finder-Tests',
	#package : 'NewTools-Finder-Tests'
}

{ #category : 'running' }
StFinderClassTest >> setUp [

	super setUp.
	presenterModel currentSearch: StFinderClassSearch new
	
]

{ #category : 'tests' }
StFinderClassTest >> testSearchForRegexpStartWithCaseInsensitive [

	| results searchPattern |
	
	self openInstance.
	searchPattern := '^StFinderMockA'.
	presenter searchOptions regexpCheckBox click.
	presenter searchBar searchInput text: searchPattern.
	
	presenterModel 
		searchString: searchPattern;
		search.
	results := presenter resultTree roots.

	self 
		assertCollection: (results collect: [ : r | r content name ])
		hasSameElements: #(#StFinderMockA #StFinderMocka).
]

{ #category : 'tests' }
StFinderClassTest >> testSearchForRegexpStartWithCaseSensitive [

	| results searchPattern |
	
	self openInstance.
	searchPattern := '^StFinderMockA'.
	presenter searchOptions regexpCheckBox click.
	presenter searchOptions caseCheckBox click.
	presenter searchBar searchInput text: searchPattern.
	
	presenterModel 
		searchString: searchPattern;
		search.
	results := presenter resultTree roots.
	self 
		assert: results size
		equals: 1.
]

{ #category : 'tests' }
StFinderClassTest >> testSubstringSearchNonExistingSelector [

	self openInstance.
	
	presenterModel 
		currentSearch: StFinderSelectorSearch new;	
		searchString: 'NonExistingClass';
		search.
	self assertEmpty: presenter resultTree roots
]
