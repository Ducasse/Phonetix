"
Soundex2 is a more effective implementation of Soundex. It converts a given surname into a 4-character code consisting of an alphabet and 3 numbers.

"
Class {
	#name : #Soundex2,
	#superclass : #PhoneticAlgoritms,
	#category : #'Phonetix-Soundex'
}

{ #category : #'as yet unclassified' }
Soundex2 class >> description [
	^'Soundex2 is a more effective implementation of Soundex. It converts a given surname into a 4-character code consisting of an alphabet and 3 numbers.'
]

{ #category : #'as yet unclassified' }
Soundex2 class >> language [
	^nil
]

{ #category : #action }
Soundex2 >> encode: aPHWord [
	self subclassResponsibility 
]

{ #category : #configuration }
Soundex2 >> soundexTable [
	self subclassResponsibility 
]
