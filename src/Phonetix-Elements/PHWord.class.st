"
A PHWord is a word.
"
Class {
	#name : #PHWord,
	#superclass : #PHAbstractSimpleElement,
	#category : #'Phonetix-Elements'
}

{ #category : #'initialize-release' }
PHWord class >> from: aString [
	"Create a word with the string"
	^self new from: aString
]

{ #category : #'initialize-release' }
PHWord class >> from: aString engine: aPHEngine [
	"Create a word with the string"
	^self new engine: aPHEngine; from: aString
]

{ #category : #'initialize-release' }
PHWord class >> with: aString [
	"Create a word with the string"
	^self new with: aString
]

{ #category : #'initialize-release' }
PHWord class >> with: aString engine: aPHEngine [
	"Create a word with the string"
	^self new engine: aPHEngine; with: aString
]

{ #category : #visit }
PHWord >> acceptVisitorForNumberOfComplexWords: aVisitor [
	^aVisitor numberOfComplexWordsIntoWord: self
]

{ #category : #visit }
PHWord >> acceptVisitorForNumberOfSentences: aVisitor [
	^aVisitor numberOfSentencesIntoWord: self
]

{ #category : #visit }
PHWord >> acceptVisitorForNumberOfSyllabes: aVisitor [
	^aVisitor numberOfSyllabesIntoWord: self
]

{ #category : #visit }
PHWord >> acceptVisitorForNumberOfWords: aVisitor [
	^aVisitor numberOfWordsIntoWord: self
]

{ #category : #action }
PHWord >> encodeWith: aSoundexAlgorithm [
	^engine encode: self with: aSoundexAlgorithm 
]

{ #category : #accessing }
PHWord >> from: aString [
	content := aString
]

{ #category : #action }
PHWord >> hammingDistanceWith:  aWord [
	"return the Hamming Distance between two words"
	
	^engine hammingDistanceOf: self with: aWord
	
]

{ #category : #action }
PHWord >> isComplexWord [
	^engine isComplexWord: self
]

{ #category : #action }
PHWord >> isWord [
	^true
]

{ #category : #action }
PHWord >> levenshteinDistanceWith: aWord [
	"return the Levenshtein distance between two words"

	^engine levenshteinDistanceOf: self With: aWord
]

{ #category : #action }
PHWord >> soundex [
	^engine soundex: self
]

{ #category : #accessing }
PHWord >> word [ 

	^ content
]
