"
A PHNumber is a number.

"
Class {
	#name : #PHNumber,
	#superclass : #PHAbstractSimpleElement,
	#category : #'Phonetix-Elements'
}

{ #category : #visit }
PHNumber >> acceptVisitorForNumberOfComplexWords: aVisitor [
	^aVisitor numberOfComplexWordsIntoNumber: self
]

{ #category : #visit }
PHNumber >> acceptVisitorForNumberOfSentences: aVisitor [
	^aVisitor numberOfSentencesIntoNumber: self
]

{ #category : #visit }
PHNumber >> acceptVisitorForNumberOfSyllabes: aVisitor [
	^aVisitor numberOfSyllabesIntoNumber: self
]

{ #category : #visit }
PHNumber >> acceptVisitorForNumberOfWords: aVisitor [
	^aVisitor numberOfWordsIntoNumber: self
]

{ #category : #action }
PHNumber >> isComplexWord [
	^false
]

{ #category : #action }
PHNumber >> isWord [
	^false
]
