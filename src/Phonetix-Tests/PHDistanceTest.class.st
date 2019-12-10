Class {
	#name : #PHDistanceTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHDistanceTest >> setUp [
	phonetix := PHEngineEnglish new
]

{ #category : #tests }
PHDistanceTest >> testHammingDistance [
	self assert: ((PHWord with: 'abcde' engine: phonetix) hammingDistanceWith: (PHWord with: 'abcde' engine: phonetix)) equals: 0.
	self assert: ((PHWord with: 'abxxef' engine: phonetix) hammingDistanceWith: (PHWord with: 'abcdef' engine: phonetix)) equals: 2.
	self assert: ((PHWord with: 'xxxxx' engine: phonetix) hammingDistanceWith: (PHWord with: 'aaaaa' engine: phonetix)) equals: 5.
	self assert: ((PHWord with: 'abcde' engine: phonetix) hammingDistanceWith: (PHWord with: 'cdeab' engine: phonetix)) equals: 5.
	self assert: ((PHWord with: '' engine: phonetix) hammingDistanceWith: (PHWord with: '' engine: phonetix)) equals: 0.

]

{ #category : #tests }
PHDistanceTest >> testLevenshteinDistance [
	self assert: ((PHWord with: 'abcde' engine: phonetix) levenshteinDistanceWith: (PHWord with: 'abcde' engine: phonetix)) equals: 0.
	self assert: ((PHWord with: 'abxxef' engine: phonetix) levenshteinDistanceWith: (PHWord with: 'abcdef' engine: phonetix)) equals: 2.
	self assert: ((PHWord with: 'xxxxx' engine: phonetix) levenshteinDistanceWith: (PHWord with: 'aaaaa' engine: phonetix)) equals: 5.
	self assert: ((PHWord with: 'abcde' engine: phonetix) levenshteinDistanceWith: (PHWord with: 'cdeab' engine: phonetix)) equals: 4.
	self assert: ((PHWord with: '' engine: phonetix) levenshteinDistanceWith: (PHWord with: '' engine: phonetix)) equals: 0.
]
