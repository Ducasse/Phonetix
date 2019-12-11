"
A SoundexFrench is basic soundex implementation for french language.
"
Class {
	#name : #SoundexFrench,
	#superclass : #Soundex,
	#category : #'Phonetix-Soundex'
}

{ #category : #registration }
SoundexFrench class >> algorithm [
	^Soundex
]

{ #category : #registration }
SoundexFrench class >> language [
	^PHFrenchLanguage
]

{ #category : #configuration }
SoundexFrench >> soundexTable [
	self flag: #todo. "turn me in a class variable"
	^{  $B->$1 . $C->$2 . $D->$3 . $F->$9 . $G->$7 . $J->$7 .
		$K->$2 . $L->$4 . $M->$5 . $N->$5 . $P->$1 . $Q->$2 . $R->$6 . $S->$8 . $T->$3 .
	  	$V->$9 . $X-> $8 . $Z->$8 } asDictionary
]

{ #category : #configuration }
SoundexFrench >> specialCharTable [
	"Answer a conversion table for the specials characters"
	self flag: #todo. "turn me in a class variable"
	
	^{
		$à->$A . $ä->$A . $â->$A .
		$é->$E . $è->$E . $ê->$E . $ë->$E .
		$î->$I . $ï->$I .
		$ô->$O . $ö->$O . 
		$û->$U . $ü->$U .
		$À->$A . $Ä->$A . $Â->$A .
		$É->$E . $È->$E . $Ê->$E . $Ë->$E .
		$Î->$I . $Ï->$I .
		$Ô->$O . $Ö->$O . 
		$Û->$U . $Ü->$U .
		$ç->$C	
	} asDictionary
]
