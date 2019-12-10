Class {
	#name : #PHDocumentTest,
	#superclass : #TestCase,
	#instVars : [
		'document'
	],
	#category : #'Phonetix-Tests'
}

{ #category : #values }
PHDocumentTest >> bytes [
	^2034
]

{ #category : #values }
PHDocumentTest >> complexWords [
	^97
]

{ #category : #values }
PHDocumentTest >> sentences [
	^41
]

{ #category : #'initialize-release' }
PHDocumentTest >> setUp [
	document := (PHDocument with: 'Duis tortor magna, fringilla quis vestibulum nec, facilisis nec tortor. Suspendisse blandit pretium justo. Nulla varius, neque quis rutrum lacinia, tortor urna bibendum dolor, eu pulvinar purus ante in purus. Maecenas id interdum erat, vel finibus sapien. In viverra sollicitudin ipsum, eu suscipit magna iaculis eget. Duis maximus nec justo vehicula eleifend. Aliquam finibus vehicula ligula eget lacinia. Ut dui arcu, maximus eget semper et, iaculis vitae massa. Nunc sit amet tempor erat, dictum sagittis nunc. Morbi nec fringilla lectus.

Proin tristique tincidunt urna scelerisque dictum. Vivamus et ultricies nisl, at vulputate nisi. Ut aliquam nulla non erat viverra interdum. Integer eros enim, feugiat at dui a, dictum tristique nunc. Nulla nibh sem, rhoncus pretium placerat ut, tempus at dolor. Pellentesque quis orci eu justo consectetur rutrum vitae sit amet libero. Nunc diam ex, semper a neque nec, dictum lobortis purus. Curabitur ut tempus diam. Cras tincidunt pellentesque finibus. Duis blandit nunc porttitor, facilisis quam at, accumsan ipsum. Morbi et orci elementum, imperdiet risus id, iaculis magna. Aenean nec suscipit elit, vel pharetra lacus. Suspendisse in nibh pulvinar, eleifend quam sed, mattis ex. Sed faucibus dignissim placerat. Suspendisse potenti. Curabitur nec interdum nibh.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec rutrum mi vel rutrum condimentum. Praesent consequat metus felis. Aliquam arcu nisl, convallis et auctor ut, varius nec nisi. Maecenas interdum velit ipsum, ac bibendum ante dignissim et. Etiam aliquam rhoncus pulvinar. Suspendisse interdum consectetur pellentesque. In hac habitasse platea dictumst. Morbi elit diam, fermentum molestie fermentum ut, elementum ac lorem. Sed magna eros, ornare et ligula ut, sodales blandit lorem. Morbi eget nisl quam. Cras et euismod tellus, eu tempus velit. Etiam et enim sit amet nunc hendrerit tincidunt vitae ut libero. Vestibulum porta sed tellus eu interdum. Etiam vitae augue metus.' engine: PHEngineFrench new).
]

{ #category : #values }
PHDocumentTest >> syllabes [
	^633
]

{ #category : #tests }
PHDocumentTest >> testNumberOfComplexWords [
	self assert: (document numberOfComplexWords = self complexWords)
]

{ #category : #tests }
PHDocumentTest >> testNumberOfSentences [
	self assert: (document numberOfSentences  = self sentences)
]

{ #category : #tests }
PHDocumentTest >> testNumberOfSyllabes [
	self assert: (document numberOfSyllabes = self syllabes)
]

{ #category : #tests }
PHDocumentTest >> testNumberOfWords [
	self assert: (document numberOfWords = self words)
]

{ #category : #values }
PHDocumentTest >> words [
	^300
]
