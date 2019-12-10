"
Nysiis is a phonetic algorithl devised in 1970 as part of the New York State Identification and Intelligence System. It converts a given surname into a string consisting of an alphabet.

"
Class {
	#name : #Nysiis,
	#superclass : #PhoneticAlgoritms,
	#category : #'Phonetix-Soundex'
}

{ #category : #registration }
Nysiis class >> algorithm [
	^Nysiis
]

{ #category : #registration }
Nysiis class >> description [
	^'Nysiis is a phonetic algorithl devised in 1970 as part of the New York State Identification and Intelligence System. It converts a given surname into a string consisting of an alphabet.'
]

{ #category : #registration }
Nysiis class >> language [
	^PHEnglishLanguage 
]

{ #category : #action }
Nysiis >> encode: aPHWord [
	| str firstChar buffer |
	str := self cleanString: aPHWord content.
	str size > 0 
		ifTrue: [ 
			str := str replaceFirstCharacters: {'MAC'.'KN'.'K'.'PH'.'PF'.'SCH'} 
				withDictionary: {  'MAC'->'MCC'. 'KN'->'NN'.'K'->'C'.'PH'->'FF'.'PF'->'FF'.'SCH'->'SSS' } asDictionary. 
			str := str replaceLastCharacters: { 'EE'.'IE'.'DT'.'RT'.'RD'.'NT'.'ND' }
				withDictionary: { 'EE'->'Y'.'IE'->'Y'.'DT'->'D'.'RT'->'D'.'RD'->'D'.'NT'->'D'.'ND'->'D' } asDictionary.
			
			firstChar := str first asString.
			str := str allButFirst.		
			str := str copyWithRegex: 'EV' matchesReplacedWith: 'AF'.
			str := str replaceLetters: #($E $I $O $U) by: $A.		
			str := str replaceStringsWithDictionary: { 'Q'->'G'. 'Z'->'S'. 'M'->'N'.'SCH'->'SSS'.'PH'->'FF'} asDictionary.
			(str includesSubstring: 'KN')
				ifTrue: [ str := str copyReplaceAll: 'KN' with: 'N' ]
				ifFalse: [  str := str copyReplaceAll: 'K' with: 'C' ].
			
			"Si une lettre non voyelle précède ou suit un H, on ne conserve que la précédente"
			buffer := WriteStream on: (String new).
			1 to: (str size) do: [  :pos |
				| charBefore charAfter |
				((str at: pos) = $H)
					ifTrue: [
						charBefore := str at: (pos - 1) ifAbsent: Character space.
						charAfter := str at: (pos - 1) ifAbsent: Character space.
						(charBefore isVowel and: [ charAfter isVowel ]) ifTrue: [ buffer nextPut: $H ].
					 ]
					ifFalse: [ buffer nextPut: (str at: pos) ]
			].
			str := buffer contents.
			
			str := str copyReplaceAll: 'AW' with: 'A'.
			str size > 0 ifTrue: [ (str last = $S) ifTrue: [ str := str allButLast  ] ].
			str size >= 2 ifTrue: [  str := str replaceString: 'AY' startAt: (str size - 1) with: 'Y' ].
			str size > 0 ifTrue: [ (str last = $A) ifTrue: [ str := str allButLast  ] ].
			str := firstChar , str removeDuplicateCharacters.	
		].
		^str cutAt: 6 paddingWith: Character space

		
]
