"
A PHAbstractEntity is a word or a number.
"
Class {
	#name : #PHAbstractSimpleElement,
	#superclass : #PHElementType,
	#instVars : [
		'content'
	],
	#category : #'Phonetix-Elements'
}

{ #category : #accessing }
PHAbstractSimpleElement >> content [
	^ content
]

{ #category : #accessing }
PHAbstractSimpleElement >> with: aString [
	content := aString
]
