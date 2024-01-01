"
I am a widget for the ̀Finder̀ tool. I contain all widgets regarding the search options.

The ""Match Regular Expression"" checkbox and the ""Match Exact"" checkboxes in the search bar are mutually exclusive. This means that only one of them can be selected at a time. The reason behind this is that both checkboxes serve different purposes and using them simultaneously could lead to contradictory results.

- The ""Match Regular Expression"" checkbox allows users to enter a regular expression (regex) in the search bar. Regex is a powerful tool for pattern matching in strings. For example, if you want to find all words that start with 'a', you could use the regex ^a.
- On the other hand, the ""Match Exact"" checkbox would cause the search to return only those entries that exactly match the search string.

If both options were allowed to be selected at the same time, it would create confusion and potentially incorrect results. For instance, if a user enters '^a' in the search bar with the ""Match Exact"" checkbox selected, the system would try to find entries that exactly match the regex ^a, which doesn't make sense.

Therefore, to avoid such situations, it's best to keep these two checkboxes mutually exclusive.

"
Class {
	#name : 'StFinderSearchOptions',
	#superclass : 'SpPresenter',
	#instVars : [
		'regexpCheckBox',
		'exactCheckBox',
		'caseCheckBox'
	],
	#category : 'NewTools-Finder-Widgets',
	#package : 'NewTools-Finder',
	#tag : 'Widgets'
}

{ #category : 'layout' }
StFinderSearchOptions >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 2;
		add: regexpCheckBox;
		add: exactCheckBox;
		add: caseCheckBox;
		yourself
]

{ #category : 'accessing' }
StFinderSearchOptions >> disableRegex [

	regexpCheckBox enabled: false.
]

{ #category : 'accessing' }
StFinderSearchOptions >> enableRegex [

	regexpCheckBox enabled: true.
]

{ #category : 'initialization' }
StFinderSearchOptions >> initializePresenters [

	regexpCheckBox := self newCheckBox 
		label: 'Regexp';
		help: 'Use regular expression';
		yourself.
		
	exactCheckBox := self newCheckBox 
		label: 'Exact';
		help: 'Use exact match';
		yourself.
		
	caseCheckBox := self newCheckBox 
		label: 'Case';
		help: 'Use match case';
		yourself
]

{ #category : 'events' }
StFinderSearchOptions >> whenCaseActivatedDo: aBlock [

	caseCheckBox whenActivatedDo: aBlock.

]

{ #category : 'events' }
StFinderSearchOptions >> whenCaseDeactivatedDo: aBlock [

	caseCheckBox whenDeactivatedDo: aBlock.

]

{ #category : 'events' }
StFinderSearchOptions >> whenExactActivatedDo: aBlock [

	exactCheckBox whenActivatedDo: aBlock.

]

{ #category : 'events' }
StFinderSearchOptions >> whenExactDeactivatedDo: aBlock [

	exactCheckBox whenDeactivatedDo: aBlock.
]

{ #category : 'events' }
StFinderSearchOptions >> whenRegexActivatedDo: aBlock [

	regexpCheckBox whenActivatedDo: aBlock
]

{ #category : 'events' }
StFinderSearchOptions >> whenRegexDeactivatedDo: aBlock [

	regexpCheckBox whenDeactivatedDo: aBlock
]
