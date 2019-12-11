Class {
	#name : #PHPhoneticAlgorithmsTest,
	#superclass : #TestCase,
	#instVars : [
		'algoritms'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize - release' }
PHPhoneticAlgorithmsTest >> setUp [
	algoritms := PhoneticAlgoritms new
]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testAllIndexOf [
	self assert: ('' allIndexOf: 'MCC') equals: #() asOrderedCollection.
	self assert: ('MCC' allIndexOf: 'MCC') equals: #(1) asOrderedCollection.
	self assert: ('AMCC' allIndexOf: 'MCC') equals: #(2) asOrderedCollection.
	self assert: ('AMCCBMCC' allIndexOf: 'MCC') equals: #(2 6) asOrderedCollection.
	
]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testRemoveCharExceptIfAfterAnotherChar [
	self assert: ('' remove: $H exceptIfAfter: #($C $S)) = ''.
	self assert: ('HECHTSHZH' remove: $H exceptIfAfter: #($C $S)) =  'HECHTSHZ'.
	self assert: ('HECHTSHZHA' remove: $H exceptIfAfter: #($C $S)) =  'HECHTSHZA'.
	self assert: ('HECHTSHZHC' remove: $H exceptIfAfter: #($C $S)) =  'HECHTSHZC'.
	self assert: ('HECHTSHZCHC' remove: $H exceptIfAfter: #($C $S)) =  'HECHTSHZCHC'.
	self assert: ('CHECHTRHZCHC' remove: $H exceptIfAfter: #($C $S)) =  'CHECHTRZCHC'.
	self assert: ('CHHECHTHSHZCHC' remove: $H exceptIfAfter: #($C $S)) =   'CHECHTSHZCHC'.
]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testRemoveCharExceptIfAtPosition [
	self assert: ('' remove: $A exceptIfAtPosition: 1) = ''.
	self assert: ('ABAAB' remove: $A exceptIfAtPosition: 1) = 'ABB'.
	self assert: ( 'CABAAB' remove: $A exceptIfAtPosition: 1) = 'CBB'.

]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testRemoveDuplicateCharacters [
	self assert: ('' removeDuplicateCharacters) = ''.
	self assert: ('A' removeDuplicateCharacters) = 'A'. 
	self assert: ('AA' removeDuplicateCharacters) = 'A'. 
	self assert: ('ABB' removeDuplicateCharacters) = 'AB'. 
	self assert: ('ABBCCD' removeDuplicateCharacters) = 'ABCD'. 
	self assert: ('ABBCDD' removeDuplicateCharacters) = 'ABCD'. 
]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testReplaceLettersByInto [
	self assert: ('' replaceLetters: #($E  $I) by: $A) = ''. 
	self assert: ('ERTI' replaceLetters: #($E  $I) by: $A) = 'ARTA'. 
]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testReplaceStringsWithDictionary [
	self assert: ('' replaceStringsWithDictionary: {'AA'->'BB' . 'DY'->'TTR'} asDictionary) = ''. 
	self assert: ('ZAAWDYP' replaceStringsWithDictionary: {'AA'->'BB' . 'DY'->'TTR'} asDictionary) = 'ZBBWTTRP'. 
]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testreplaceCharacterIfAfter [
	self assert: ('' replaceCharacter: $K with: $E ifAfter: #( $C)) = ''.
	self assert: ('ACAC' replaceCharacter: $C with: $S ifAfter: #( $E $I )) = 'ACAC'.
	self assert: ('ECACIC' replaceCharacter: $C with: $S ifAfter: #( $E $I )) = 'ESACIS'.

]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testreplaceFirstCharactersWithDictionaryInto [
	| stringPatterns stringDictionary |
	
	stringPatterns := { 'A' . 'DD' . 'D' } asOrderedCollection.
	stringDictionary := 	{  'A' -> 'BB'. 'DD'->'X' . 'D' -> 'XYZ' } asDictionary.

	self assert: ('' replaceFirstCharacters: stringPatterns withDictionary: stringDictionary) = ''.
	self assert: ('BRFDE' replaceFirstCharacters: stringPatterns withDictionary: stringDictionary) = 'BRFDE'.
	self assert: ('AXXX' replaceFirstCharacters: stringPatterns withDictionary: stringDictionary) = 'BBXXX'.
	self assert: ('RDDT' replaceFirstCharacters: stringPatterns withDictionary: stringDictionary) = 'RDDT'.
	self assert: ('DDAZ' replaceFirstCharacters: stringPatterns withDictionary: stringDictionary) = 'XAZ'.
	self assert: ('D' replaceFirstCharacters: stringPatterns withDictionary: stringDictionary) = 'XYZ'.
	self assert: ('DD' replaceFirstCharacters: stringPatterns withDictionary: stringDictionary) = 'X'.
]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testreplaceLastCharactersWithDictionaryInto [
	| stringPatterns stringDictionary |
	
	stringPatterns := { 'EE' . 'A' . 'P' } asOrderedCollection.
	stringDictionary := 	{  'EE' -> 'Y'. 'A'->'Z' . 'P' -> 'XYZ' } asDictionary.

	self assert: ('' replaceLastCharacters: stringPatterns withDictionary: stringDictionary) = ''.
	self assert: ('ZEEEE' replaceLastCharacters: stringPatterns withDictionary: stringDictionary) = 'ZEEY'.
	self assert: ('EE' replaceLastCharacters: stringPatterns withDictionary: stringDictionary) = 'Y'.
	self assert: ('XYZA' replaceLastCharacters: stringPatterns withDictionary: stringDictionary) = 'XYZZ'.
	self assert: ('P' replaceLastCharacters: stringPatterns withDictionary: stringDictionary) = 'XYZ'.
	self assert: ('APP' replaceLastCharacters: stringPatterns withDictionary: stringDictionary) = 'APXYZ'.

]

{ #category : #tests }
PHPhoneticAlgorithmsTest >> testreplaceStringStartAt [
	self assert: ('' replaceString: 'K' startAt: 1 with: 'C') = ''.
	self assert: ('TNTT' replaceString: 'K' startAt: 1 with: 'C') = 'TNTT'.
	self assert: ('MACHINE' replaceString: 'MAC' startAt: 1 with: 'MCC') = 'MCCHINE'. 
	self assert: ('KNTT' replaceString: 'KN' startAt: 1 with: 'NN') = 'NNTT'.
	self assert: ('KNTT' replaceString: 'K' startAt: 1 with: 'C') = 'CNTT'.
]
