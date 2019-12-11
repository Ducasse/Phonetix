Class {
	#name : #PHDocumentParserTest,
	#superclass : #TestCase,
	#instVars : [
		'phonetix',
		'text',
		'parser'
	],
	#category : #Phonetix
}

{ #category : #values }
PHDocumentParserTest >> bytes [
	^2038
]

{ #category : #values }
PHDocumentParserTest >> complexWords [
	^97
]

{ #category : #values }
PHDocumentParserTest >> sentences [
	^41
]

{ #category : #'initialize-release' }
PHDocumentParserTest >> setUp [

	phonetix := PHEngineEnglish new.

	text := 'Duis tortor magna, fringilla quis vestibulum nec, facilisis nec tortor. Suspendisse blandit pretium justo. Nulla varius, neque quis rutrum lacinia, tortor urna bibendum dolor, eu pulvinar purus ante in purus. Maecenas id interdum erat, vel finibus sapien. In viverra sollicitudin ipsum, eu suscipit magna iaculis eget. Duis maximus nec justo vehicula eleifend. Aliquam finibus vehicula ligula eget lacinia. Ut dui arcu, maximus eget semper et, iaculis vitae massa. Nunc sit amet tempor erat, dictum sagittis nunc. Morbi nec fringilla lectus.

Proin tristique tincidunt urna scelerisque dictum. Vivamus et ultricies nisl, at vulputate nisi. Ut aliquam nulla non erat viverra interdum. Integer eros enim, feugiat at dui a, dictum tristique nunc. Nulla nibh sem, rhoncus pretium placerat ut, tempus at dolor. Pellentesque quis orci eu justo consectetur rutrum vitae sit amet libero. Nunc diam ex, semper a neque nec, dictum lobortis purus. Curabitur ut tempus diam. Cras tincidunt pellentesque finibus. Duis blandit nunc porttitor, facilisis quam at, accumsan ipsum. Morbi et orci elementum, imperdiet risus id, iaculis magna. Aenean nec suscipit elit, vel pharetra lacus. Suspendisse in nibh pulvinar, eleifend quam sed, mattis ex. Sed faucibus dignissim placerat. Suspendisse potenti. Curabitur nec interdum nibh.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec rutrum mi vel rutrum condimentum. Praesent consequat metus felis. Aliquam arcu nisl, convallis et auctor ut, varius nec nisi. Maecenas interdum velit ipsum, ac bibendum ante dignissim et. Etiam aliquam rhoncus pulvinar. Suspendisse interdum consectetur pellentesque. In hac habitasse platea dictumst. Morbi elit diam, fermentum molestie fermentum ut, elementum ac lorem. Sed magna eros, ornare et ligula ut, sodales blandit lorem. Morbi eget nisl quam. Cras et euismod tellus, eu tempus velit. Etiam et enim sit amet nunc hendrerit tincidunt vitae ut libero. Vestibulum porta sed tellus eu interdum. Etiam vitae augue metus.'. 

	parser  := PHDocumentParser text: text engine: phonetix.
]

{ #category : #values }
PHDocumentParserTest >> syllabes [
	^633
]

{ #category : #tests }
PHDocumentParserTest >> testIsAtEndOfText [
	self assert: (parser isAtEndOfText = false).
	parser position: self bytes.
	self assert: (parser isAtEndOfText = true).
	parser position: (self bytes + 1).
	self assert: (parser isAtEndOfText = true)
]

{ #category : #tests }
PHDocumentParserTest >> testNextPosition [
	
	parser nextPosition.
	self assert: (parser position = 2).

	parser position: self bytes.
	parser nextPosition.
	self assert: (parser position = self bytes).
	
]

{ #category : #tests }
PHDocumentParserTest >> testNumberOfComplexWords [
	| document |
	document := parser parse.
	self assert: document numberOfComplexWords equals: self complexWords
]

{ #category : #tests }
PHDocumentParserTest >> testNumberOfSentences [
	| document |
	document := parser parse.
	self assert: document numberOfSentences equals: self sentences
]

{ #category : #tests }
PHDocumentParserTest >> testNumberOfSyllabes [
	| document |
	document := parser parse.
	self assert: document numberOfSyllabes equals: self syllabes
]

{ #category : #tests }
PHDocumentParserTest >> testNumberOfWords [

	| document |
	document := parser parse.
	self assert: document numberOfWords equals: self words
]

{ #category : #values }
PHDocumentParserTest >> words [
	^300
]
