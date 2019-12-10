Class {
	#name : #PHMetaphoneEnglishTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHMetaphoneEnglishTest >> setUp [
	phonetix := PHEngineEnglish new.
]

{ #category : #'initialize-release' }
PHMetaphoneEnglishTest >> testMetaphoneEnglish [
	self assert: ((PHWord with: '' engine: phonetix) encodeWith: Metaphone) equals: ''.
	self assert: ((PHWord with: ' ' engine: phonetix) encodeWith: Metaphone) equals: ''.	
	self assert: ((PHWord with: 'A' engine: phonetix) encodeWith: Metaphone) equals: 'A'.
	self assert: ((PHWord with: 'Z' engine: phonetix) encodeWith: Metaphone) equals: 'Z'.
	self assert: ((PHWord with: 'HOUSE' engine: phonetix) encodeWith: Metaphone) equals: 'HS'.
	self assert: ((PHWord with: 'CHAR' engine: phonetix) encodeWith: Metaphone) equals: 'XR'.
	self assert: ((PHWord with: 'COMPUTER' engine: phonetix) encodeWith: Metaphone) equals: 'KMPT'.
	self assert: ((PHWord with: 'ANNA' engine: phonetix) encodeWith: Metaphone) equals: 'AN'.
]
