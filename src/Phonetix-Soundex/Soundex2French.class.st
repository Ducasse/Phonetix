"
A Soundex2English is a phonetic algorithm for french words.
"
Class {
	#name : #Soundex2French,
	#superclass : #Soundex2,
	#category : #'Phonetix-Soundex'
}

{ #category : #registration }
Soundex2French class >> algorith [
	^Soundex2
]

{ #category : #registration }
Soundex2French class >> algorithm [
	^Soundex2
]

{ #category : #registration }
Soundex2French class >> language [
	^PHFrenchLanguage
]

{ #category : #action }
Soundex2French >> encode: aPHWord [
	"answer the soundex2 value of a string (french version)"

	| str  |
	
	str := self cleanString: aPHWord content.
	str := str replaceStringsWithDictionary: self soundexTable. 
	(str size > 1) ifTrue: [ ((str first) ~= $A) ifTrue: [ str := str replaceLetters: #($E $I $O $U) by: $A ] ].
	str := str replaceStringsWithDictionary: (self prefixTable).
	str := str remove: $H exceptIfAfter:  #( $C $S ).
	str := str remove: $Y exceptIfAfter:  #( $A ).
	(str size > 1) ifTrue: [ (#($A $T $D $S) includes: str last) ifTrue: [  str := str allButLast  ] ].
	str := str remove: $A exceptIfAtPosition: 1.

	str := str removeDuplicateCharacters.

	^str cutAt: 4 paddingWith: Character space.
]

{ #category : #configuration }
Soundex2French >> prefixTable [
	^{ 
		'MAC'-> 'MCC' .
		'ASA'->'AZA'.
		'KN'->'NN'.
		'PF'->'FF'.
		'SCH'->'SSS'.
		'PH'->'FF' 
	} asDictionary
]

{ #category : #configuration }
Soundex2French >> soundexTable [
	^{ 
		'GUI'-> 'KI' . 
		'GUE'->'KE'.
		'GA'->'KA'.
		'GO'->'KO'.
		'GU'->'K'.
		'CA'->'KA'.
		'CO'->'KO'.
		'CU'->'KU'.
		'Q'->'K'.
		'CC'->'K'.
		'CK'->'K'
	} asDictionary
]
