"
A PHParagraph is composed of sentences and words.

"
Class {
	#name : #PHParagraph,
	#superclass : #PHElementType,
	#instVars : [
		'sentences'
	],
	#category : #'Phonetix-Elements'
}

{ #category : #visit }
PHParagraph >> acceptVisitorForNumberOfComplexWords: aVisitor [
	^aVisitor numberOfComplexWordsIntoParagraph: self
]

{ #category : #visit }
PHParagraph >> acceptVisitorForNumberOfSentences: aVisitor [
	^aVisitor numberOfSentencesIntoParagraph: self
]

{ #category : #visit }
PHParagraph >> acceptVisitorForNumberOfSyllabes: aVisitor [
	^aVisitor numberOfSyllabesIntoParagraph: self
]

{ #category : #visit }
PHParagraph >> acceptVisitorForNumberOfWords: aVisitor [
	^aVisitor numberOfWordsIntoParagraph: self
]

{ #category : #configuration }
PHParagraph >> delimiters [
	"answer the standard delimiters between sentences"
	^'.!?'
]

{ #category : #'initialize-release' }
PHParagraph >> initialize [
	super initialize.
	
	self sentences: OrderedCollection new
]

{ #category : #private }
PHParagraph >> parse: aString [

	"parse the text of the paragraph and creates sentences"
	
	(aString substrings: self delimiters) do: [ :each | self sentences add: (PHSentence with: each engine: engine) ].
	^self
]

{ #category : #accessing }
PHParagraph >> sentences [
	^ sentences
]

{ #category : #accessing }
PHParagraph >> sentences: anObject [
	sentences := anObject
]
