Class {
	#name : #PHEngineTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHEngineTest >> setUp [
	phonetix := PHEngineEnglish new.
]

{ #category : #tests }
PHEngineTest >> testSoundexAlgorithmsDetection [
	self assert: ((phonetix phoneticAlgorithms) size > 0)
]
