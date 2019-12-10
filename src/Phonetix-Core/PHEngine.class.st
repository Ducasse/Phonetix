"
A PHEngine is use to apply phonetic operations with strings.

"
Class {
	#name : #PHEngine,
	#superclass : #Object,
	#instVars : [
		'phoneticAlgorithms'
	],
	#category : #'Phonetix-Core'
}

{ #category : #'help-text' }
PHEngine class >> FrameworkManual [
	<wikiStyleHelp: #'Phonetix'>
	^ self comment
]

{ #category : #registration }
PHEngine class >> language [
	self subclassResponsibility 
]

{ #category : #ressources }
PHEngine class >> phoneticEnginesAvailable [
	"answer the list of the phonetic engines"
	
	| engines |
	
	engines := self allSubclasses.
	(engines isEmpty) ifTrue: [
		^{  self } reject: [  :engine | engine = PHEngine ]
	].
	
	^engines
]

{ #category : #actions }
PHEngine >> encode: aPHWord with: aSoundexAlgorithm [
	^(self phoneticAlgorithms at: aSoundexAlgorithm) encode: aPHWord
]

{ #category : #actions }
PHEngine >> fleshIndicator: aDocument [ 
	"calculate the flesh indicator of a document"
	
	^self fleshIndicatorWords:  (aDocument numberOfWords) sentences:  (aDocument numberOfSentences) syllabes: (aDocument numberOfSyllabes) 
	

]

{ #category : #private }
PHEngine >> fleshIndicatorWords: words sentences: sentences syllabes: syllabes [
	"calculate the flesh indicator from the number of words, the number of sentences and the number of syllabes"
	
	| averageWordsPerSentence averageSyllabesPerWord |	
		
	averageWordsPerSentence := words / sentences.
	averageSyllabesPerWord := syllabes / words.
	
	"format with 3 decimal places"
	 ^ (206.835 - (1.015 * averageWordsPerSentence) - (84.6 * averageSyllabesPerWord)) roundDownTo: 0.001.

]

{ #category : #actions }
PHEngine >> gunningFogIndicator: aDocument [
	"calculate the gunning-fog indicator of a document"
	
	^self gunningFogIndicatorWords: (aDocument numberOfWords) complexWords: (aDocument numberOfComplexWords) sentences: (aDocument numberOfSentences)
]

{ #category : #private }
PHEngine >> gunningFogIndicatorWords: words complexWords: complexWords sentences: sentences [
	"calculate the gunning-fog indicator from the number of words, the number of complex words and the number of sentences"
	
	| averageWordsPerSentence proportionOfComplexWords |
	
	averageWordsPerSentence :=  words / sentences.
	proportionOfComplexWords := complexWords / words.
	
	^(0.4 * (averageWordsPerSentence + (100 * proportionOfComplexWords))) roundDownTo: 0.001
]

{ #category : #distance }
PHEngine >> hammingDistanceOf: aWord with: anotherWord [
	
	| distance lenmax |
		
	"length of the more long string"
	lenmax := ({ aWord content size . anotherWord content size } asSortedCollection: [ :a :b | a > b ]) first.
	
	"calcul of the distance"
	distance := 0.
	1 to: lenmax do: [ :pos | ((aWord content at: pos) ~=  (anotherWord content at: pos)) ifTrue: [ distance := distance + 1 ] ].
	^distance
]

{ #category : #'initialize-release' }
PHEngine >> initialize [
	super initialize.
	
	phoneticAlgorithms := Dictionary new.

	"the engine is registering all the soundex algorithms with the same language"
	(PhoneticAlgoritms allSubclasses) do: [ :algo | 			
		(algo language = self class language) ifTrue: [ 
			phoneticAlgorithms at: (algo algorithm) put: (algo new)
		]
	]
	
]

{ #category : #actions }
PHEngine >> isComplexWord: aWord [
	"answer true if the word contains more that 3 syllabes"
	
	^(self numberOfSyllabesInto: aWord) >= 3


]

{ #category : #distance }
PHEngine >> levenshteinDistanceOf: aWord With: anotherWord [
	"return the Levenshtein distance between two words"
	
	| stab cost |
	
	"if a string is empty, answer the length of the another string"
 	(aWord content size = 0) ifTrue: [ ^anotherWord content size ].
	(anotherWord content size = 0) ifTrue: [ ^aWord content size ].
	
	stab := Matrix rows: (anotherWord content size + 1) columns: (aWord content size + 1).
	1 to: stab columnCount  do: [ :i | stab at: 1 at: i put: (i - 1) ].
	1 to: stab rowCount  do: [ :i | stab at: i at: 1 put: (i - 1) ].
	
	2 to: stab columnCount do: [ :i |
		2 to: stab rowCount do: [ :j |
				((aWord content at: i - 1) = (anotherWord content at: j - 1)) ifTrue: [ cost := 0 ] ifFalse: [ cost := 1].
				stab at: j at: i put: ({ (stab at: j at: (i - 1)) + 1 . (stab at: (j - 1) at: i) + 1 . ((stab at: (j - 1) at: (i - 1)) + cost) } asSortedCollection: [ :a :b | a < b ]) first. ] ].
	^stab at: stab rowCount at: stab columnCount
]

{ #category : #actions }
PHEngine >> numberOfComplexWordsInto: anElement [
	"return the number of complex words into the element"
	
	^anElement acceptVisitorForNumberOfComplexWords: self
]

{ #category : #'visitors-complex-words' }
PHEngine >> numberOfComplexWordsIntoDocument: aDocument [
	^aDocument paragraphs inject: 0 into: [ :sum :each | sum + each numberOfComplexWords ] 
]

{ #category : #'visitors-complex-words' }
PHEngine >> numberOfComplexWordsIntoNumber: aWord [
	"a number can't be a complex word"
	
	^0
]

{ #category : #'visitors-complex-words' }
PHEngine >> numberOfComplexWordsIntoParagraph: aParagraph [
	^aParagraph sentences inject: 0 into: [ :sum :each | sum + each numberOfComplexWords ] 
]

{ #category : #'visitors-complex-words' }
PHEngine >> numberOfComplexWordsIntoSentence: aSentence [
	^aSentence words count: [ :word | word isComplexWord ]
]

{ #category : #'visitors-complex-words' }
PHEngine >> numberOfComplexWordsIntoWord: aWord [
	"answer 1 if the word is complex"
	
	^(self isComplexWord: aWord) asBit
]

{ #category : #actions }
PHEngine >> numberOfSentencesInto: anElement [
	"return the number of sentences into the element"
	
	^anElement acceptVisitorForNumberOfSentences: self 
]

{ #category : #'visitors-sentences' }
PHEngine >> numberOfSentencesIntoDocument: aDocument [
	^aDocument paragraphs inject: 0 into: [ :sum :each | sum + each numberOfSentences ] 
]

{ #category : #'visitors-sentences' }
PHEngine >> numberOfSentencesIntoNumber: aElement [
	^0
]

{ #category : #'visitors-sentences' }
PHEngine >> numberOfSentencesIntoParagraph: aParagraph [
	^aParagraph sentences size
]

{ #category : #'visitors-sentences' }
PHEngine >> numberOfSentencesIntoSentence: aSentence [
	^1
]

{ #category : #'visitors-sentences' }
PHEngine >> numberOfSentencesIntoWord: aElement [
	^0
]

{ #category : #actions }
PHEngine >> numberOfSyllabesInto: anElement [
	"return the approximate number of syllable into the element"
	
	^anElement acceptVisitorForNumberOfSyllabes: self 
	
]

{ #category : #'visitors-syllabes' }
PHEngine >> numberOfSyllabesIntoDocument: aElement [
	^aElement paragraphs inject: 0 into: [ :sum :each | sum + each numberOfSyllabes ] 
]

{ #category : #'visitors-syllabes' }
PHEngine >> numberOfSyllabesIntoNumber: aWord [
	"no syllabes in a number"
	^0
]

{ #category : #'visitors-syllabes' }
PHEngine >> numberOfSyllabesIntoParagraph: aElement [
	^aElement sentences inject: 0 into: [ :sum :each | sum + each numberOfSyllabes ] 
]

{ #category : #'visitors-syllabes' }
PHEngine >> numberOfSyllabesIntoSentence: aElement [
	^aElement words inject: 0 into: [ :sum :each | sum + each numberOfSyllabes ] 
]

{ #category : #'visitors-syllabes' }
PHEngine >> numberOfSyllabesIntoWord: aWord [
	"return the approximate number of syllable into the word"
	| n i j |
	
	n := 0.
	i := 0.
	j := 0.
	
	aWord content do: [ :char |
		(char isVowel)
			ifTrue: [
				i := 1.
				(i ~= j) ifTrue: [ 
					n := n + 1.
					j := 1 ] ]
			ifFalse: [
				i := 0. 
				j := 0 ] ].
	(n > 1) ifTrue: [ (aWord word last = $E and: [ j = 0 ]) ifTrue: [ n := n - 1 ] ].
	^n
  
]

{ #category : #actions }
PHEngine >> numberOfWordsInto: anElement [
	"return the  number of words into the element"
	
	^anElement acceptVisitorForNumberOfWords: self 
]

{ #category : #'visitors-Words' }
PHEngine >> numberOfWordsIntoDocument: aDocument [
	^aDocument paragraphs inject: 0 into: [ :sum :each | sum + each numberOfWords ]
]

{ #category : #'visitors-Words' }
PHEngine >> numberOfWordsIntoNumber: aWord [
	^0
]

{ #category : #'visitors-Words' }
PHEngine >> numberOfWordsIntoParagraph: aParagraph [
	^aParagraph sentences inject: 0 into: [ :sum :each | sum + each numberOfWords ]
]

{ #category : #'visitors-Words' }
PHEngine >> numberOfWordsIntoSentence: aSentence [
	^aSentence words size
]

{ #category : #'visitors-Words' }
PHEngine >> numberOfWordsIntoWord: aWord [
	^1
]

{ #category : #accessing }
PHEngine >> phoneticAlgorithms [
	^ phoneticAlgorithms
]

{ #category : #accessing }
PHEngine >> phoneticAlgorithms: anObject [
	phoneticAlgorithms := anObject
]
