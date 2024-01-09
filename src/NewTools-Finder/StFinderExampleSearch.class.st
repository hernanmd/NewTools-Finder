Class {
	#name : 'StFinderExampleSearch',
	#superclass : 'StFinderSearch',
	#category : 'NewTools-Finder-Search',
	#package : 'NewTools-Finder',
	#tag : 'Search'
}

{ #category : 'execution' }
StFinderExampleSearch >> computeDataObjects: aString [

	| data dataObjects |
	(aString includes: $.) ifFalse: [ ^ #(  ) ].
	data := aString trimRight: [ :char |
		        char isSeparator or: [ char = $. ] ].
	
	[
		dataObjects := self parseAsNodes: data.
		dataObjects do: [ : e | e evaluateWithTimeOut: self evaluationTimeout ] ]
	on: CodeError , RuntimeSyntaxError
	do: [ :e |
		self inform: 'Error: ' , e messageText.
		^ #(  ) ] .

	dataObjects size < 2 ifFalse: [ ^ dataObjects ].
	self inform:
		'If you are giving an example of receiver, \args, and result, please put periods between the parts.\Otherwise just type one selector fragment'
			withCRs.
	^ #(  )
]

{ #category : 'execution' }
StFinderExampleSearch >> computeWithMethodFinder: aString [
	"Compute the selectors for the single example of receiver and args, in the very top pane"

	^ (self computeDataObjects: aString) 
		ifNotEmpty: [ : dataObjects | 
			StMethodFinder new 
				findMethodsByExampleInput: dataObjects allButLast 
				andExpectedResult: dataObjects last
				timeout: self evaluationTimeout ]
		ifEmpty: [ Array empty ]
]

{ #category : 'execution' }
StFinderExampleSearch >> evaluationTimeout [
	"Answer a <Number> representing the timeout for individual calls in the receiver's search"

	^ StFinderSettings evaluationTimeout
]

{ #category : 'testing' }
StFinderExampleSearch >> isFinderExampleSearch [

	^ true
]

{ #category : 'information' }
StFinderExampleSearch >> name [
	"Returns the name of the search."

	^ 'Examples'
]

{ #category : 'parsing' }
StFinderExampleSearch >> parseAsNodes: anExpression [

	^ (RBParser parseExpression: '{', anExpression , '}') statements asArray
]

{ #category : 'accessing' }
StFinderExampleSearch >> previewPresenter [

	^ MicrodownPresenter
]

{ #category : 'accessing' }
StFinderExampleSearch >> previewText [
	
	^ '"Use an example to find a method in the system.

   ''a''. ''b''. ''ab'' "will find the message #, for strings concatenation"
   2. -2                "will find the message #negated"
   3. 6                 "will find the message #factorial"
   20. 10. 15. 15       "will find the message #min:max:"

It works on collections too:

   {2. 4. 5. 1}. 5. 3   will find the message #indexOf:
   {2. 5. 1}. 5. true   will find the message #includes:

An example is made up of the following two or more items separated by a period:

	receiver. answer
	receiver. argument1. answer
	receiver. argument1. argument2. answer
	etc...

For example, type: 3. 4. 7. into the search box and click <Search>

Take care on separating spaces because of floating point numbers.

 	3.4.7      will find nothing, it is interpreted two numbers, 3.4 and. 7
	3. 4. 7    will find you the message #+

The examples array should contain one object for the receiver, one object per expected argument and then a final object with the expected result.

In other words
 - a unary method example expects an array of input objects #( receiver ) and an expected result
 - a binary method example expects an array with two input objects #( receiver argument ) and an expected result
 - a keyword method example expects an array with at least two elements  #( receiver argument1 argument2 ... ) and an expected results

The method finder will take the input objects (receiver and arguments) and perform their permutation to be able to find more results.
Then, it will lookup in the receiver''s hierarchy the approved and forbidden methods to run on the hierarchy and run them on the permutation of objects.

Receiver and arguments do not have to be in the right order.

Alternatively, in this bottom pane or in the Playground, use #findMethodsByExampleInput:andExpectedResult: directly to find a method in the system.  Select this line of code and choose "print it" or "inspect it.

	MethodFinder new findMethodsByExampleInput: #( 1 2 ) andExpectedResult: 3.

It is useful when you want to look for computed objects:

	MethodFinder new
		findMethodsByExampleInput: {''29 Apr 1999'' asDate}
		andExpectedResult: ''30 Apr 1999'' asDate.

This will find the message #next.

	MethodFinder new
		findMethodsByExampleInput: {''30 Apr 1999'' asDate}
		andExpectedResult: ''Friday''.

This will find the message #dayOfWeekName

The Method Finder is not trying all methods in the system so if it will find nothing, a method with requested behavior may still exist." '
]

{ #category : 'accessing' }
StFinderExampleSearch >> search: aString in: aRBBrowserEnvironment [ 
	"Answer a <Collection> of results"
	"ToDo: Evaluate in the context of aRBBrowserEnvironment methodsDo: [ : method |"

	^ self computeWithMethodFinder: aString

]

{ #category : 'initialization' }
StFinderExampleSearch >> setSearchStrategyFrom: aDictionary [
	"Set the receiver's search strategy according to aCollection of options"

]

{ #category : 'accessing' }
StFinderExampleSearch >> validSearchOptions [
	"Answer a <Collection> of valid search options for the receiver"
	
	^ #(#deactivateAll)
]
