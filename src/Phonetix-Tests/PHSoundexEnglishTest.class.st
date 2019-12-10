Class {
	#name : #PHSoundexEnglishTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHSoundexEnglishTest >> setUp [
	phonetix := PHEngineEnglish new.
]

{ #category : #tests }
PHSoundexEnglishTest >> testSoundexEnglish [
	self assert: ((PHWord with: '' engine: phonetix) encodeWith: Soundex) equals: '0000'.
	self assert: ((PHWord with: 'A' engine: phonetix) encodeWith: Soundex) equals: 'A000'.
	self assert: ((PHWord with: 'Z' engine: phonetix) encodeWith: Soundex) equals: 'Z000'.
	self assert: ((PHWord with: 'HOUSE' engine: phonetix) encodeWith: Soundex) equals: 'H200'.
	self assert: ((PHWord with: 'CHAR' engine: phonetix) encodeWith: Soundex) equals: 'C600'.
	self assert: ((PHWord with: 'COMPUTER' engine: phonetix) encodeWith: Soundex) equals: 'C513'.
	self assert: ((PHWord with: 'ANNA' engine: phonetix) encodeWith: Soundex) equals: 'A500'.


]
