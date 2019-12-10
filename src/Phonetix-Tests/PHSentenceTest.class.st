Class {
	#name : #PHSentenceTest,
	#superclass : #TestCase,
	#instVars : [
		'sentence'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #values }
PHSentenceTest >> bytes [
	^61
]

{ #category : #values }
PHSentenceTest >> complexWords [
	^3
]

{ #category : #values }
PHSentenceTest >> sentences [
	^1
]

{ #category : #'initialize-release' }
PHSentenceTest >> setUp [
	sentence := (PHSentence with: 'Proin eget turpis vel nibh finibus elementum sodales et nunc.' engine: (PHEngineFrench new))
]

{ #category : #values }
PHSentenceTest >> syllabes [
	^19
]

{ #category : #tests }
PHSentenceTest >> testNumberOfComplexWords [
	self assert: (sentence numberOfComplexWords = self complexWords)
]

{ #category : #tests }
PHSentenceTest >> testNumberOfSentences [
	self assert: (sentence numberOfSentences = self sentences)
]

{ #category : #tests }
PHSentenceTest >> testNumberOfSyllabes [
	self assert: (sentence numberOfSyllabes = self syllabes)
]

{ #category : #tests }
PHSentenceTest >> testNumberOfWords [
	self assert: (sentence numberOfWords = self words)
]

{ #category : #values }
PHSentenceTest >> words [
	^10
]
