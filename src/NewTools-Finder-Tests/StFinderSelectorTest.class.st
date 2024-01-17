Class {
	#name : 'StFinderSelectorTest',
	#superclass : 'StFinderTest',
	#category : 'NewTools-Finder-Tests',
	#package : 'NewTools-Finder-Tests'
}

{ #category : 'running' }
StFinderSelectorTest >> setUp [

	super setUp.
	presenterModel currentSearch: StFinderSelectorSearch new
	
]

{ #category : 'tests' }
StFinderSelectorTest >> testSearchForRegexpStartWithCaseInsensitive [

	| results searchPattern |
	
	self openInstance.
	searchPattern := '^aBC.*'.
	presenter searchOptions regexpCheckBox click.
	presenter searchBar searchInput text: searchPattern.
	
	presenterModel 
		searchString: searchPattern;
		search.
	results := presenter resultTree roots.

	self 
		assertCollection: (results collect: #content)
		hasSameElements: #(#aBCSelectorSearchForRegexpStartWithCase #abcSelectorSearchForRegexpStartWithoutCase).
]

{ #category : 'tests' }
StFinderSelectorTest >> testSearchForRegexpStartWithCaseSensitive [

	| results searchPattern |
	
	self openInstance.
	searchPattern := '^aBC.*'.
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
StFinderSelectorTest >> testSubstringSearchNonExistingSelector [

	self openInstance.
	
	presenterModel 
		currentSearch: StFinderSelectorSearch new;	
		search: 'lalala'.
	self assertEmpty: presenter resultTree roots
]
