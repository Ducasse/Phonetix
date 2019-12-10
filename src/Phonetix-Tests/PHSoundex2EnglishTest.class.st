Class {
	#name : #PHSoundex2EnglishTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHSoundex2EnglishTest >> setUp [
	phonetix := PHEngineEnglish new.
]

{ #category : #tests }
PHSoundex2EnglishTest >> testSoundex2English [
	self assert: ((PHWord with: '' engine: phonetix) encodeWith: Soundex2) equals: '0000'.
	self assert: ((PHWord with: ' ' engine: phonetix) encodeWith: Soundex2) equals: '0000'.	
	self assert: ((PHWord with: 'A' engine: phonetix) encodeWith: Soundex2) equals: 'A000'.
	self assert: ((PHWord with: 'Z' engine: phonetix) encodeWith: Soundex2) equals: 'Z000'.
	self assert: ((PHWord with: 'HOUSE' engine: phonetix) encodeWith: Soundex2) equals: 'H300'.
	self assert: ((PHWord with: 'CHAR' engine: phonetix) encodeWith: Soundex2) equals: 'C900'.
	self assert: ((PHWord with: 'COMPUTER' engine: phonetix) encodeWith: Soundex2) equals: 'C816'.
	self assert: ((PHWord with: 'ANNA' engine: phonetix) encodeWith: Soundex2) equals: 'A800'.
]
