"
A SoundexAlgorithms is an abstract class.

"
Class {
	#name : #PhoneticAlgoritms,
	#superclass : #Object,
	#category : #'Phonetix-Soundex'
}

{ #category : #registration }
PhoneticAlgoritms class >> language [
	self subclassResponsibility 
]

{ #category : #private }
PhoneticAlgoritms >> cleanString: aString [
	"clean the string content and convert to uppercase
	for non english language, i must remove the special chars"
	
	^(self convertSpecialsChar: (aString removeNotLettersChar)) translateToUppercase.
]

{ #category : #private }
PhoneticAlgoritms >> convertSpecialsChar: aString [
	"answer the conversion of the special chars in a string"
	
	| table specialChars |
	
	table := self specialCharTable.
	specialChars := self specialCharTable keys asSet.
	
	^aString collect: [ :each | (specialChars includes: each) ifTrue: [ table at: each  ] ifFalse: [ each ] ]		
]

{ #category : #action }
PhoneticAlgoritms >> encode: aPHWord [
	self subclassResponsibility 
]

{ #category : #tools }
PhoneticAlgoritms >> removeNotLettersChar: aString [
	"remove all the chars that are not a letter"
	
	^aString select:  [ :aChar | aChar isLetter ].
]

{ #category : #configuration }
PhoneticAlgoritms >> specialCharTable [
	"answer a conversion table for the specials characters"
	^{} asDictionary
]
