Extension { #name : #ByteString }

{ #category : #'*Phonetix' }
ByteString >> allIndexOf: aPatternString [
	"Answer the list of indexes of a PatternString in a string"
	| indexes pos |
	
	indexes := OrderedCollection new.
	(self size > 0) ifTrue: [ 
		pos := 1.
		[  
			| index  |		
			index := self indexOfSubCollection: aPatternString startingAt: pos.
			(index > 0) ifTrue: [ 
				indexes add: index.
				pos := index + (aPatternString size).
			 ].
			(index ~= 0 and: [ pos <= self size])
		] whileTrue.
	].
	^indexes
]

{ #category : #'*Phonetix' }
ByteString >> cutAt: aLength paddingWith: aCharacter [
	(self size < aLength) 
		ifTrue: [ ^self padRightTo: aLength with: aCharacter ]
		ifFalse: [ ^self truncateTo: aLength  ]	
]

{ #category : #'*Phonetix' }
ByteString >> remove: aChar exceptIfAfter:  anArrayOfChars [
	| result previousChar currentChar appendCurrentChar |
	
	result := WriteStream on: (String new).
	previousChar := nil.
	
	self do: [ :c |
		currentChar := c. 
		appendCurrentChar := true.
		(previousChar isNotNil) 
			ifTrue: [ 
				(currentChar = aChar)
					ifTrue: [ (anArrayOfChars includes: previousChar) ifFalse: [  appendCurrentChar := false ] ]
			].
		(appendCurrentChar) 
			ifTrue: [ 
				result nextPut: currentChar.
				previousChar := currentChar.  
			]
	].
	^result contents
]

{ #category : #'*Phonetix' }
ByteString >> remove: aChar exceptIfAtPosition: aPosition [
	| result |
	
	result := WriteStream on: (String new).
		
	1 to: (self size) do: [ :p | 
		((self at: p) = aChar and: (p ~= aPosition)) ifFalse: [ result nextPut: (self at: p) ]		
	].
	^result contents
]

{ #category : #'*Phonetix' }
ByteString >> removeDuplicateCharacters [
	| result previouschar |
	(self size) > 1 ifTrue: [ 
		result :=  WriteStream on: (String new).
		result nextPut: self first.
		previouschar := self first.
		2 to: (self size) do: [ :i | 
			| char |
			char := self at: i.
			(char ~= previouschar) 
				ifTrue: [  
					previouschar := char.
					result nextPut: char.
				]
		].
		^result contents.
	]
	ifFalse: [  ^self ]
]

{ #category : #'*Phonetix' }
ByteString >> removeNotLettersChar [
	"remove all the chars that are not a letter"
	
	^self select:  [ :aChar | aChar isLetter ].
]

{ #category : #'*Phonetix' }
ByteString >> replaceCharacter: aChar with: anotherChar ifAfter: aArrayOfCharacters [
	(self size > 1) 
		ifTrue: [  
			^self withIndexCollect: [ :each :idx |  
					(idx > 1) 
						ifTrue: [
							(each = aChar) 
								ifTrue: [ 
									(aArrayOfCharacters includes: (self at: (idx - 1))) ifTrue: [  anotherChar ] ifFalse: [ aChar ]
								]
								ifFalse: [ each ]
						]
						ifFalse: [ self at: 1 ]
				]		
		]
		ifFalse: [  ^self ]
]

{ #category : #'*Phonetix' }
ByteString >> replaceFirstCharacters: anOrderedcollectionOfString withDictionary: aDictionary [
	"replace the first characters of a string with a value of a dictionary (exclusive choice)"

	| idx found pattern result |
	
	(anOrderedcollectionOfString size) > 0 
		ifTrue: [
			idx := 1.
			found := false.
			[  
				pattern := anOrderedcollectionOfString at: idx.
				(self size >= pattern size)
					ifTrue: [ found := ((self copyFrom: 1 to: (pattern size)) = pattern) ].
				idx := idx + 1.
				(found = false and: [  idx <= anOrderedcollectionOfString size ])
			] whileTrue.
			found 
				ifTrue: [  
					result := WriteStream on: (String new).
					result 
						nextPutAll: (aDictionary at: pattern);
						nextPutAll: (self copyFrom:  (pattern size + 1) to: (self size)).
					^result contents.			
				]
				ifFalse: [ ^self  ]
		]
		ifFalse: [ ^self ]
]

{ #category : #'*Phonetix' }
ByteString >> replaceLastCharacters: anOrderedcollectionOfString withDictionary: aDictionary [
	"replace the last characters of a string with a value of a dictionary (exclusive choice)"

	| idx found pattern result |
	
	(anOrderedcollectionOfString size) > 0 
		ifTrue: [
			idx := 1.
			found := false.
			[  
				pattern := anOrderedcollectionOfString at: idx.
				(self size >= pattern size)
					ifTrue: [ found := ((self copyFrom: (self size - pattern size + 1) to: (self size)) = pattern) ].
				idx := idx + 1.
				(found = false and: [  idx <= anOrderedcollectionOfString size ])
			] whileTrue.
			found 
				ifTrue: [  
					result := WriteStream on: (String new).
					result 
						nextPutAll: (self copyFrom:  1 to: (self size - pattern size));
						nextPutAll: (aDictionary at: pattern).
					^result contents.			
				]
				ifFalse: [ ^self  ]
		]
		ifFalse: [ ^self ]
]

{ #category : #'*Phonetix' }
ByteString >> replaceLetters: aCollectionOfChars by: aChar [
	"replace in the string a set of chars by a char"

	^self collect: [ :each | (aCollectionOfChars includes: each) ifTrue: [ aChar ] ifFalse: [ each ] ]	
]

{ #category : #'*Phonetix' }
ByteString >> replaceString: aPatternString startAt: aPosition with: anotherString [
	| str indexes |

	str := WriteStream on: (String new).
	(self size >= (aPatternString size)) ifTrue: [ 
		indexes := self allIndexOf: aPatternString.
		(indexes includes: aPosition) 
			ifTrue: [  
				str 
					nextPutAll: (self copyFrom: 1 to: (aPosition -1));
					nextPutAll: anotherString;
					nextPutAll: (self copyFrom: (aPosition + aPatternString size) to: (self size))
			]
			ifFalse: [ str nextPutAll: self ]	
	].
	 ^str contents
]

{ #category : #'*Phonetix' }
ByteString >> replaceStringsWithDictionary: aDictionary [
	| str |
	
	str := self.
	aDictionary keysAndValuesDo: [ :key :value |  str := str copyWithRegex: key matchesReplacedWith: value ].
	^str
]
