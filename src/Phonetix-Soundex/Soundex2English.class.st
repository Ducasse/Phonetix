"
A Soundex2English is a phonetic algorithm for english words.

"
Class {
	#name : #Soundex2English,
	#superclass : #Soundex2,
	#traits : 'PhoneticAlgorithmsSharedMethods',
	#classTraits : 'PhoneticAlgorithmsSharedMethods classTrait',
	#category : #'Phonetix-Soundex'
}

{ #category : #registration }
Soundex2English class >> algorithm [
	^Soundex2
]

{ #category : #registration }
Soundex2English class >> language [
	^PHEnglishLanguage 
]

{ #category : #action }
Soundex2English >> encode: aPHWord [
	"answer the soundex value of a word" 
	"onlyLetters translateToUppercase"
	
	| result  table str   |

	str := self cleanString: aPHWord content.
	
	^ str isEmpty
		ifTrue: [  '0000']
		ifFalse: [ 
			result := WriteStream on: (String new).
			table := self soundexTable.
			result nextPut: str first.
			str allButFirst do: [  :each | 
				table at: each ifPresent: [ : c | result nextPut: c ] ].
			(result contents removeDuplicateCharacters cutAt: 4 paddingWith: $0)
		]
		
		
]

{ #category : #configuration }
Soundex2English >> soundex2Table [
	self flag: #todo. "turn me in a class variable"
	^{ $A-> '' . $B->$1 . $C->$3 . $D->$6 . $E->'' . $F->$2 . $G->$4 . $H->'' . $I->'' . $J->$4 .
		$K->$3 . $L->$7 . $M->$8 . $N->$8 . $O->'' . $P->$1 . $Q->$5 . $R->$9 . $S->$3 . $T->$6 .
	 	$U->'' . $V->$3 . $W->'' . $X-> $5 . $Y->'' . $Z->$5 } asDictionary
		
]

{ #category : #configuration }
Soundex2English >> soundexTable [
	self flag: #todo. "turn me in a class variable"
	^{ $B->$1 . $C->$3 . $D->$6 . $F->$2 . $G->$4 . $J->$4 .
		$K->$3 . $L->$7 . $M->$8 . $N->$8 . $P->$1 . $Q->$5 . $R->$9 . $S->$3 . $T->$6 .
	  	$V->$3 . $X-> $5 . $Z->$5 } asDictionary
		
]
