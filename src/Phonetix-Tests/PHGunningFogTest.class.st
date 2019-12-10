Class {
	#name : #PHGunningFogTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHGunningFogTest >> setUp [
	phonetix := PHEngineFrench new.
]

{ #category : #tests }
PHGunningFogTest >> testGunningFog [
	self assert: (phonetix gunningFogIndicatorWords: 800 complexWords: 50 sentences: 10)  equals: 34.5
]
