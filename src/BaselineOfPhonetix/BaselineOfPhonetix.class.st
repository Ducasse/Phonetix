Class {
	#name : #BaselineOfPhonetix,
	#superclass : #BaselineOf,
	#category : #BaselineOfPhonetix
}

{ #category : #baselines }
BaselineOfPhonetix >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: 'Phonetix' with: [ spec requires: #('Phonetix-Elements') ];
			package: 'Phonetix-Core' with: [ spec requires: #('Phonetix-Languages' 'Phonetix-Soundex') ];
			package: 'Phonetix-Elements';
			package: 'Phonetix-Languages';
			package: 'Phonetix-Soundex' with: [ spec requires: #('Phonetix-Languages')];
			package: 'Phonetix-Tests' with: [ spec requires: #('Phonetix-Core' 'Phonetix-Elements' 'Phonetix-Soundex') ]
		]
]
