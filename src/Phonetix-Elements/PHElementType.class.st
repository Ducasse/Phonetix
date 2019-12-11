"
A PHElementType is an abstract part of a document. It can represent the document himself, a paragraph, a sentence or a word.

"
Class {
	#name : #PHElementType,
	#superclass : #Object,
	#instVars : [
		'engine',
		'start',
		'end',
		'firstWord',
		'lastWord'
	],
	#category : #'Phonetix-Elements'
}

{ #category : #'initialize-release' }
PHElementType class >> from: aString [
	^self new parse: aString
]

{ #category : #'initialize-release' }
PHElementType class >> from: aString engine: aPHEngine [
	^self new engine: aPHEngine; parse: aString
	
]

{ #category : #'initialize-release' }
PHElementType class >> with: aString [
	^self new parse: aString
]

{ #category : #'initialize-release' }
PHElementType class >> with: aString engine: aPHEngine [
	^self new engine: aPHEngine; parse: aString
	
]

{ #category : #accessing }
PHElementType >> end [
	^ end
]

{ #category : #accessing }
PHElementType >> end: anObject [
	end := anObject
]

{ #category : #'initialize-release' }
PHElementType >> engine: aPHEngine [
	engine := aPHEngine
]

{ #category : #accessing }
PHElementType >> firstWord [
	^ firstWord
]

{ #category : #accessing }
PHElementType >> firstWord: anObject [
	firstWord := anObject
]

{ #category : #accessing }
PHElementType >> lastWord [
	^ lastWord
]

{ #category : #accessing }
PHElementType >> lastWord: anObject [
	lastWord := anObject
]

{ #category : #action }
PHElementType >> numberOfComplexWords [
	^engine numberOfComplexWordsInto: self
]

{ #category : #action }
PHElementType >> numberOfSentences [
	self halt.
	^engine numberOfSentencesInto: self
]

{ #category : #action }
PHElementType >> numberOfSyllabes [
	^engine numberOfSyllabesInto: self
]

{ #category : #action }
PHElementType >> numberOfWords [
	^engine numberOfWordsInto: self
]

{ #category : #accessing }
PHElementType >> start [
	^ start
]

{ #category : #accessing }
PHElementType >> start: anObject [
	start := anObject
]
