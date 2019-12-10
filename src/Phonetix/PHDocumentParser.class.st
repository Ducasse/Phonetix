"
A PHDocumentParser is a text parser. It returns an instance of PHDocument.
"
Class {
	#name : #PHDocumentParser,
	#superclass : #Object,
	#instVars : [
		'text',
		'engine',
		'language',
		'document',
		'position'
	],
	#category : #Phonetix
}

{ #category : #'as yet unclassified' }
PHDocumentParser class >> parse: aText engine: aEngine [
	^self new text: aText; engine: aEngine; parse
]

{ #category : #'as yet unclassified' }
PHDocumentParser class >> text: aText engine: aEngine [
	^self new text: aText; engine: aEngine
]

{ #category : #accessing }
PHDocumentParser >> engine [
	^ engine
]

{ #category : #accessing }
PHDocumentParser >> engine: anObject [
	engine := anObject
]

{ #category : #action }
PHDocumentParser >> extractSubString [
	"Answers 1 or 2 characters extracted from the text at the current position"
	
	self isAtEndOfText 
		ifTrue: [ ^(self text at: self position) asString ] 
		ifFalse: [ ^self text copyFrom: (self position) to: (self position + 1) ]
]

{ #category : #'initialize-release' }
PHDocumentParser >> initialize [
	super initialize.
	
	self position: 1.
]

{ #category : #action }
PHDocumentParser >> isAtEndOfText [
	"answer true if the parser is at end of text"

	^(self position >= self text size)
]

{ #category : #action }
PHDocumentParser >> nextPosition [
	"set the position at the next character"
	
	self isAtEndOfText ifFalse: [ self position: self position + 1 ]
]

{ #category : #private }
PHDocumentParser >> parse [
	| token |
	
	self isAtEndOfText ifFalse: [ 	
		language := self engine class language.
		document := PHDocument new.
		token := WriteStream on: String new.
	
		self text doWithIndex: [ :char :idx |

	]
 ]

]

{ #category : #accessing }
PHDocumentParser >> position [
	^ position
]

{ #category : #accessing }
PHDocumentParser >> position: anObject [
	position := anObject
]

{ #category : #accessing }
PHDocumentParser >> text [
	^ text
]

{ #category : #accessing }
PHDocumentParser >> text: anObject [
	text := anObject
]
