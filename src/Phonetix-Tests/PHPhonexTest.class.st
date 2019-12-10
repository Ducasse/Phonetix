Class {
	#name : #PHPhonexTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHPhonexTest >> setUp [
	phonetix := PHEngineFrench new.
]

{ #category : #tests }
PHPhonexTest >> testPhonexFrench [
	self assert: ((PHWord with: '' engine: phonetix) encodeWith: Phonex) equals: 0.0.
	self assert: ((PHWord with: ' ' engine: phonetix) encodeWith: Phonex) equals: 0.0.
	self assert: ((PHWord with: 'A' engine: phonetix) encodeWith: Phonex) equals: 0.590909.
	self assert: ((PHWord with: 'Z' engine: phonetix) encodeWith: Phonex) equals: 0.954545.
	self assert: ((PHWord with: 'MAISON' engine: phonetix) encodeWith: Phonex) equals: 0.588243.
	self assert: ((PHWord with: 'CHAR' engine: phonetix) encodeWith: Phonex) equals: 0.209992.
	self assert: ((PHWord with: 'ORDINATEUR' engine: phonetix) encodeWith: Phonex) equals: 0.621378.
	self assert: ((PHWord with: 'PIERRE' engine: phonetix) encodeWith: Phonex) equals: 0.747807.

]
