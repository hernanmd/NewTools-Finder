Class {
	#name : 'StFinderClassTest',
	#superclass : 'StFinderTest',
	#category : 'NewTools-Finder-Tests',
	#package : 'NewTools-Finder-Tests'
}

{ #category : 'running' }
StFinderClassTest >> setUp [

	super setUp.
	presenterModel currentSearch: StFinderClassSearch new.
	self openInstance.
]

{ #category : 'tests' }
StFinderClassTest >> testSearchForExactCaseInsensitiveStringMissing [

	self setExactAndCaseInsensitive.
	self doSearch: 'stfindermock'.

	self assertEmpty: presenter resultTree roots.

]

{ #category : 'tests' }
StFinderClassTest >> testSearchForExactCaseInsensitiveStringSucess [

	| results |
	
	self setExactAndCaseInsensitive.
	self doSearch: 'stfindermocka'.

	results := presenter resultTree roots.
	self 
		assertCollection: (results collect: [ : r | r content name ])
		hasSameElements: #(#StFinderMockA #StFinderMocka).
]

{ #category : 'tests' }
StFinderClassTest >> testSearchForExactCaseSensitiveStringMissing [

	self setExactAndCaseSensitive.
	self doSearch: 'StFinderMock'.

	self assertEmpty: presenter resultTree roots.

]

{ #category : 'tests' }
StFinderClassTest >> testSearchForExactCaseSensitiveStringSucess [

	| results |
	
	self setExactAndCaseSensitive.
	self doSearch: 'StFinderMockA'.

	results := presenter resultTree roots.
	self 
		assert: results size
		equals: 1.
]

{ #category : 'tests' }
StFinderClassTest >> testSearchForRegexpStartWithCaseInsensitive [

	| results |
	
	self setRegexAndCaseInsensitive.
	self doSearch: '^StFinderMockA'.	
	results := presenter resultTree roots.

	self 
		assertCollection: (results collect: [ : r | r content name ])
		hasSameElements: #(#StFinderMockA #StFinderMocka).
]

{ #category : 'tests' }
StFinderClassTest >> testSearchForRegexpStartWithCaseSensitive [

	| results |
	
	self setRegexAndCaseSensitive.
	self doSearch: '^StFinderMockA'.
	results := presenter resultTree roots.
	self 
		assert: results size
		equals: 1.
]

{ #category : 'tests' }
StFinderClassTest >> testSubstringSearchNonExistingClass [

	self doSearch: 'NonExistingClass'.

	self assertEmpty: presenter resultTree roots
]
