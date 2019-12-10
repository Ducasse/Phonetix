Class {
	#name : #PHFleshIndicatorTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialization-release' }
PHFleshIndicatorTest >> setUp [
	phonetix := PHEngineFrench new.
]

{ #category : #tests }
PHFleshIndicatorTest >> testFleshIndicator [
	self assert: (phonetix fleshIndicatorWords: 800 sentences: 10 syllabes: 1600)  equals: -43.565
]
