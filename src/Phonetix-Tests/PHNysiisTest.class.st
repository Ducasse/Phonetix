Class {
	#name : #PHNysiisTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHNysiisTest >> setUp [
	phonetix := PHEngineEnglish new.
]

{ #category : #tests }
PHNysiisTest >> testNysiisEnglish [
	self assert: ((PHWord with: '' engine: phonetix) encodeWith: Nysiis) equals: '      '.
	self assert: ((PHWord with: 'A' engine: phonetix) encodeWith:  Nysiis) equals: 'A     '.
	self assert: ((PHWord with: 'Z' engine: phonetix) encodeWith:  Nysiis) equals: 'Z     '.
	self assert: ((PHWord with: 'HOUSE' engine: phonetix) encodeWith:  Nysiis) equals: 'HAS   '.
	self assert: ((PHWord with: 'CHAR' engine: phonetix) encodeWith:  Nysiis) equals: 'CAR   '.
	self assert: ((PHWord with: 'COMPUTER' engine: phonetix) encodeWith:  Nysiis) equals: 'CANPAT'.
	self assert: ((PHWord with: 'ANNA' engine: phonetix) encodeWith:  Nysiis) equals: 'AN    '.
]
