Class {
	#name : #PHSoundexFrenchTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHSoundexFrenchTest >> setUp [
	phonetix := PHEngineFrench new.
]

{ #category : #tests }
PHSoundexFrenchTest >> testSoundexFrench [
	self assert: ((PHWord with: '' engine: phonetix) encodeWith: Soundex) equals: '0000'.
	self assert: ((PHWord with: 'A' engine: phonetix) encodeWith: Soundex) equals: 'A000'.
	self assert: ((PHWord with: 'Z' engine: phonetix) encodeWith: Soundex) equals: 'Z000'.
	self assert: ((PHWord with: 'MAISON' engine: phonetix) encodeWith: Soundex) equals: 'M850'.
	self assert: ((PHWord with: 'CHAR' engine: phonetix) encodeWith: Soundex) equals: 'C600'.
	self assert: ((PHWord with: 'ORDINATEUR' engine: phonetix) encodeWith: Soundex) equals: 'O635'.
	self assert: ((PHWord with: 'PIERRE' engine: phonetix) encodeWith: Soundex) equals: 'P600'.
	


]
