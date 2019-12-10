"
A PHDocument is a textual document, composed of paragraphs, sentences and words.
"
Class {
	#name : #PHDocument,
	#superclass : #PHElementType,
	#instVars : [
		'paragraphs'
	],
	#category : #'Phonetix-Elements'
}

{ #category : #visit }
PHDocument >> acceptVisitorForNumberOfComplexWords: aVisitor [
	^aVisitor numberOfComplexWordsIntoDocument: self
]

{ #category : #visit }
PHDocument >> acceptVisitorForNumberOfSentences: aVisitor [
	^aVisitor numberOfSentencesIntoDocument: self
]

{ #category : #visit }
PHDocument >> acceptVisitorForNumberOfSyllabes: aVisitor [
	^aVisitor numberOfSyllabesIntoDocument: self
]

{ #category : #visit }
PHDocument >> acceptVisitorForNumberOfWords: aVisitor [
	^aVisitor numberOfWordsIntoDocument: self
]

{ #category : #configuration }
PHDocument >> delimiters [
	"answer the standard delimiters between paragraph"
	^(Character cr asString , Character lf asString)
]

{ #category : #action }
PHDocument >> fleshIndicator [
	^engine fleshIndicator: self
]

{ #category : #action }
PHDocument >> gunningFogIndicator [
	^engine gunningFogIndicator: self
]

{ #category : #'initialize-release' }
PHDocument >> initialize [ 
	
	super initialize.
	
	"The document is empty"
	self paragraphs: OrderedCollection new.
	
]

{ #category : #accessing }
PHDocument >> paragraphs [
	^ paragraphs
]

{ #category : #accessing }
PHDocument >> paragraphs: anObject [
	paragraphs := anObject
]

{ #category : #private }
PHDocument >> parse: aString [

	"parse the text of the document and creates paragraphs"
	
	(aString substrings: self delimiters) do: [ :each | self paragraphs add: (PHParagraph with: each engine: engine) ].
	^self
]

{ #category : #accessing }
PHDocument >> sentences [
	^ sentences
]

{ #category : #accessing }
PHDocument >> sentences: anObject [
	sentences := anObject
]
