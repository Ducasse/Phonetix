Class {
	#name : #PHSoundex2FrenchTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHSoundex2FrenchTest >> setUp [
	phonetix := PHEngineFrench new.
]

{ #category : #tests }
PHSoundex2FrenchTest >> testSoundex2French [
	self assert: ((PHWord with: '' engine: phonetix) encodeWith: Soundex2) equals: '    '.
	self assert: ((PHWord with: ' ' engine: phonetix) encodeWith: Soundex2) equals: '    '.
	self assert: ((PHWord with: 'A' engine: phonetix) encodeWith: Soundex2) equals: 'A   '.
	self assert: ((PHWord with: 'Z' engine: phonetix) encodeWith: Soundex2) equals: 'Z   '.
	self assert: ((PHWord with: 'MAISON' engine: phonetix) encodeWith: Soundex2) equals: 'MZN '.
	self assert: ((PHWord with: 'CHAR' engine: phonetix) encodeWith: Soundex2) equals: 'CHR '.
	self assert: ((PHWord with: 'ORDINATEUR' engine: phonetix) encodeWith: Soundex2) equals: 'ARDN'.
	self assert: ((PHWord with: 'PIERRE' engine: phonetix) encodeWith: Soundex2) equals: 'PR  '.
]
