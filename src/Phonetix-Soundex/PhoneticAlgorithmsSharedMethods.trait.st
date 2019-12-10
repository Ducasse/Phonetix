"
A PhoneticAlgorithmsSharedMethods is a set of methods used in some soundex algorithms (same behaviour)

"
Trait {
	#name : #PhoneticAlgorithmsSharedMethods,
	#category : #'Phonetix-Soundex'
}

{ #category : #action }
PhoneticAlgorithmsSharedMethods >> encode: aPHWord [
	"answer the soundex value of a word" 
	"onlyLetters translateToUppercase"
	
	| result  table str   |

	str := self cleanString: aPHWord content.
	
	(str size > 0)
		ifTrue: [ 
			result := WriteStream on: (String new).
			table := self soundexTable.
			
			result nextPut: str first.
			(str allButFirst) do: [  :each | 
				table at: each ifPresent: [ : c | result nextPut: c ] 
			].
			
			^(result contents removeDuplicateCharacters cutAt: 4 paddingWith: $0)
		]
		ifFalse: [  ^'0000']
		
]
