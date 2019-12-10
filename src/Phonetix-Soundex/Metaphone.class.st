"
Lawrence Philips' Metaphone Algorithm is an algorithm which returns the rough approximation of how an English word sounds.

"
Class {
	#name : #Metaphone,
	#superclass : #PhoneticAlgoritms,
	#category : #'Phonetix-Soundex'
}

{ #category : #registration }
Metaphone class >> algorithm [
	^Soundex
]

{ #category : #registration }
Metaphone class >> language [
	^PHEnglishLanguage 
]

{ #category : #action }
Metaphone >> encode: aPHWord [
	| str |
	
	str := self cleanString: aPHWord content.
	str size > 0 
		ifTrue: [ ] 
		ifFalse: [  ]

	
]
