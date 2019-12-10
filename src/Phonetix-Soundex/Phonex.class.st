"
Phonex is a very powerful algorithm and it is an evolution of the soundex algorithm that converts words into an hash that represents the way the word is spelled in French. Phonex convert a string into a real number (between 0 and 1).
"
Class {
	#name : #Phonex,
	#superclass : #PhoneticAlgoritms,
	#instVars : [
		'values'
	],
	#category : #'Phonetix-Soundex'
}

{ #category : #registration }
Phonex class >> algorithm [
	^Phonex
]

{ #category : #registration }
Phonex class >> description [
	^'The phonex algorithm is an evolution of the soundex algorithm that converts words into an hash that represents the way the word is spelled in French.'
]

{ #category : #registration }
Phonex class >> language [
	^PHFrenchLanguage
]

{ #category : #action }
Phonex >> encode: aPHWord [
	| str  result |
	
	str := self cleanString: aPHWord content.
	result := 0.0.
	
	(str size) > 0 
		ifTrue: [ 
			str := str copyReplaceAll: 'Y' with: 'I'.
			str := str remove: $H exceptIfAfter: #($C $S $P).
			str := str replaceStringsWithDictionary: {  
				'PH'->'F'. 
				'GAN'->'KAN'. 'GAM'->'KAM'. 'GAIN'->'KAIN'. 'GAIM'->'KAIM'
			} asDictionary.
			
			str := str copyWithRegex: '(AIN|EIN|AIM|EIM)[AEIOU]' matchesReplacedWith: 'YN'. 
			str := str replaceStringsWithDictionary: { 'EAU'->'O'. 'OUA'->'2'. 'EIN'->'4'. 'AIN'->'4'. 'EIM'->'4'. 'AIM'->'4' } asDictionary.		
			str := str replaceStringsWithDictionary: { 'É'->'Y'. 'È'->'Y'. 'Ê'->'Y' } asDictionary.	
			str := str replaceStringsWithDictionary: { 'AI'->'Y'. 'EI'->'Y'. 'ER'->'YR'. 'ESS'->'YSS'. 'ET'->'YT' } asDictionary.				
			str := str copyWithRegex: '(AN|AM|EN|EM)[^AEIOU24]' matchesReplacedWith: '1'.
			str := str copyWithRegex: '(IN)[^AEIOU24]' matchesReplacedWith: '4'.
			str := str copyWithRegex: '[AEIOU24]S[AEIOU24]' matchesTranslatedUsing: [ :each | each first asString , 'Z' , each third asString  ].
			str := str replaceStringsWithDictionary: { 'OE'->'E'. 'EU'->'E'. 'AU'->'O'. 'OI'->'2'. 'OY'->'2'. 'OU'->'3' } asDictionary.
			str := str replaceStringsWithDictionary: { 'CH'->'5'. 'SCH'->'5'. 'SH'->'5'. 'SS'->'S'. 'SC'->'S' } asDictionary.				
			str := str replaceCharacter: $C with: $S ifAfter: #( $E $I ).
			str := str replaceStringsWithDictionary: { 'C'->'K'. 'Q'->'K'. 'QU'->'K'. 'GU'->'K'. 'GA'->'KA'. 'GO'->'KO'. 'GY'->'KY' } asDictionary.	
			str := str replaceStringsWithDictionary: { 'A'->'O'. 'D'->'T'. 'P'->'T'. 'J'->'G'. 'B'->'F'. 'V'->'F'. 'M'->'N' } asDictionary.		
			str := str removeDuplicateCharacters.
			(str last = $T or: [ str last = $X ]) ifTrue: [  str := str allButLast ].
			
			str doWithIndex: [ :each :idx | 
				result := result + ((values at: each) * (22 ** (idx negated))).
			].				
			^result round: 6
		]
		ifFalse: [ ^result ]
]

{ #category : #'initialize-release' }
Phonex >> initialize [
	super initialize.
	values := {  
		$1->0. $2->1. $3->2. $4->3. $5->4.
		$E->5. $F->6. $G->7. $H->8. $I->9. $K->10. $L->11.
		$N->12. $O->13. $R->14. $S->15. $T->16. $U->17.
		$W->18. $X->19. $Y->20. $Z->21
	} asDictionary.
]
