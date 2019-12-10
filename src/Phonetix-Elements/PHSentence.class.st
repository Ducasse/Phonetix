"
A PHSentence is composed of words.

"
Class {
	#name : #PHSentence,
	#superclass : #PHElementType,
	#instVars : [
		'words'
	],
	#category : #'Phonetix-Elements'
}

{ #category : #visit }
PHSentence >> acceptVisitorForNumberOfComplexWords: aVisitor [
	^aVisitor numberOfComplexWordsIntoSentence: self
]

{ #category : #visit }
PHSentence >> acceptVisitorForNumberOfSentences: aVisitor [
	^aVisitor numberOfSentencesIntoSentence: self
]

{ #category : #visit }
PHSentence >> acceptVisitorForNumberOfSyllabes: aVisitor [
	^aVisitor numberOfSyllabesIntoSentence: self
]

{ #category : #visit }
PHSentence >> acceptVisitorForNumberOfWords: aVisitor [
	^aVisitor numberOfWordsIntoSentence: self
]

{ #category : #configuration }
PHSentence >> delimiters [
	"answer the standard delimiters between words in a sentence"
	^' ,;:-()[]'
]

{ #category : #'initialize-release' }
PHSentence >> initialize [
	super initialize.
	
	self words: OrderedCollection new.
]

{ #category : #action }
PHSentence >> isExclamatory [
	^false
]

{ #category : #action }
PHSentence >> isInterrogative [
	^false
]

{ #category : #private }
PHSentence >> parse: aString [
	"parse the text of the sentence and creates words"
	
	(aString substrings: self delimiters) do: [ :each | self words add: (PHWord with: each engine: engine) ].
	^self
	
]

{ #category : #accessing }
PHSentence >> words [
	^ words
]

{ #category : #accessing }
PHSentence >> words: anObject [
	words := anObject
]
