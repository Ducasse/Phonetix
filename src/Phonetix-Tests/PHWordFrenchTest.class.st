Class {
	#name : #PHWordFrenchTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #'initialize-release' }
PHWordFrenchTest >> setUp [
	phonetix := PHEngineFrench new.
]

{ #category : #tests }
PHWordFrenchTest >> testIsComplexWord [

	self assert: (PHWord with: 'UN' engine: phonetix) isComplexWord = false.
	self assert: (PHWord with: 'DEUX' engine: phonetix) isComplexWord = false.
	self assert: (PHWord with: 'EPEE' engine: phonetix) isComplexWord = false.
	self assert: (PHWord with: 'MAISON' engine: phonetix) isComplexWord = false.
	self assert: (PHWord with: 'GARAGE' engine: phonetix) isComplexWord = true.
	self assert: (PHWord with: 'AUTOMOBILE' engine: phonetix) isComplexWord = true.
	
	self assert: (PHWord with: 'TROIS' engine: phonetix) isComplexWord = false.
	

]

{ #category : #tests }
PHWordFrenchTest >> testIsNumberOfComplexWords [

	self assert: (PHWord with: 'UN' engine: phonetix) numberOfComplexWords = 0.
	self assert: (PHWord with: 'ORDINATEUR' engine: phonetix) numberOfComplexWords = 1.	

	

]

{ #category : #tests }
PHWordFrenchTest >> testSyllableCounter [
	self assert: (PHWord with: 'UN' engine: phonetix) numberOfSyllabes = 1.
	self assert: (PHWord with: 'DEUX' engine: phonetix) numberOfSyllabes = 1.
	self assert: (PHWord with: 'EPEE' engine: phonetix) numberOfSyllabes = 2.
	self assert: (PHWord with: 'MAISON' engine: phonetix) numberOfSyllabes = 2.
	self assert: (PHWord with: 'GARAGE' engine: phonetix) numberOfSyllabes = 3.
	self assert: (PHWord with: 'AUTOMOBILE' engine: phonetix) numberOfSyllabes = 5.
	
	self deny: (PHWord with: 'TROIS' engine: phonetix) numberOfSyllabes = 2.
		


]
