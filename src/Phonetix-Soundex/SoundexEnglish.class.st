"
A SoundexEnglish is basic soundex implementation for english language.
"
Class {
	#name : #SoundexEnglish,
	#superclass : #Soundex,
	#category : #'Phonetix-Soundex'
}

{ #category : #registration }
SoundexEnglish class >> algorithm [
	^Soundex
]

{ #category : #registration }
SoundexEnglish class >> language [
	^PHEnglishLanguage 
]

{ #category : #configuration }
SoundexEnglish >> soundexTable [
	^{ $B->$1 . $C->$2 . $D->$3 .  $F->$1 . $G->$2 .  $J->$2 .
		$K->$2 . $L->$4 . $M->$5 . $N->$5 . $P->$1 . $Q->$2 . $R->$6 . $S->$2 . $T->$3 .
	 	$V->$1 . $X-> $2 . $Z->$2 } asDictionary
]
