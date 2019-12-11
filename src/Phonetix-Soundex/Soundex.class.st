"
A Soundex is a basic soundex implementation.

Soundex was constructed for use by the National Archives to index the U.S. censuses. It converts a given surname into a 4-character code consisting of an alphabet and 3 numbers.

"
Class {
	#name : #Soundex,
	#superclass : #PhoneticAlgoritms,
	#traits : 'PhoneticAlgorithmsSharedMethods',
	#classTraits : 'PhoneticAlgorithmsSharedMethods classTrait',
	#category : #'Phonetix-Soundex'
}

{ #category : #registration }
Soundex class >> description [
	^'Soundex was constructed for use by the National Archives to index the U.S. censuses. It converts a given surname into a 4-character code consisting of an alphabet and 3 numbers.'
]

{ #category : #registration }
Soundex class >> language [
	^nil
]

{ #category : #action }
Soundex >> encode: aPHWord [
	"Answer the soundex value of a word" 
	"onlyLetters translateToUppercase"
	
	| result  table str   |
	str := self cleanString: aPHWord word.
	^ str isEmpty 
		ifTrue: [ '0000']
		ifFalse: [ 
			result := WriteStream on: (String new).
			table := self soundexTable.
			result nextPut: str first.
			(str allButFirst) do: [ :each | 
				table at: each ifPresent: [ : c | result nextPut: c ] ].
			(result contents removeDuplicateCharacters cutAt: 4 paddingWith: $0)
		]
]

{ #category : #configuration }
Soundex >> soundexTable [
	self subclassResponsibility 
]
