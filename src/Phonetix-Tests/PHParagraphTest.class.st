Class {
	#name : #PHParagraphTest,
	#superclass : #TestCase,
	#instVars : [
		'paragraph'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #values }
PHParagraphTest >> bytes [
	^679
]

{ #category : #values }
PHParagraphTest >> complexWords [
	^32
]

{ #category : #values }
PHParagraphTest >> sentences [
	^11
]

{ #category : #'initialize-release' }
PHParagraphTest >> setUp [
	paragraph := (PHParagraph with: 'Vestibulum blandit ultrices nibh id congue. Donec a tortor eu lectus scelerisque pulvinar. Nam ut dignissim massa. Suspendisse convallis, eros a semper fringilla, diam augue vulputate turpis, nec mattis lectus diam sit amet massa. Duis egestas vel metus vel ultricies. Maecenas purus dui, semper sit amet velit id, ullamcorper aliquam urna. Etiam finibus metus ligula, vel maximus ligula vehicula non. Nam porttitor, enim pulvinar vehicula pretium, magna arcu volutpat mauris, non tristique erat sapien sit amet tortor. Quisque ornare aliquet pharetra. Phasellus sit amet lectus laoreet, sollicitudin tellus vitae, lacinia lorem. Donec eu massa eu diam sodales hendrerit vel vel.' engine: PHEngineFrench new).
]

{ #category : #values }
PHParagraphTest >> syllabes [
	^213
]

{ #category : #tests }
PHParagraphTest >> testNumberOfComplexWords [
	self assert: paragraph numberOfComplexWords equals: self complexWords
]

{ #category : #tests }
PHParagraphTest >> testNumberOfSentences [
	self assert: paragraph numberOfSentences equals: self sentences
]

{ #category : #tests }
PHParagraphTest >> testNumberOfSyllabes [
	self assert: paragraph numberOfSyllabes equals: self syllabes
]

{ #category : #tests }
PHParagraphTest >> testNumberOfWords [
	self assert: paragraph numberOfWords equals: self words
]

{ #category : #values }
PHParagraphTest >> words [
	^100
]
