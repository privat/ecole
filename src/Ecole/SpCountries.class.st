Class {
	#name : 'SpCountries',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'code',
		'info',
		'map',
		'flag',
		'countries'
	],
	#category : 'Ecole-Objects',
	#package : 'Ecole',
	#tag : 'Objects'
}

{ #category : 'examples' }
SpCountries class >> example [

	<script>
	(SpCountries on: TheWorld load) open
]

{ #category : 'initialization' }
SpCountries >> connectPresenters [

	countries whenSelectedItemChangedDo: [ :item | self onChange: item ].
	self onChange: countries selectedItem.
"	self whenPresenterResized: [ map canvas zoomToFit ]"

]

{ #category : 'layout' }
SpCountries >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: countries;
				   add: code width: self class toolbarHeight * 2) height: self class toolbarHeight;
		  add: flag;
		  add: map;
		  add: info height: self class toolbarHeight;
		  yourself
]

{ #category : 'initialization' }
SpCountries >> initializePresenters [
"
	self model: (TheWorld new loadFile:
		         '/home/privat/Téléchargements/world.svg')."
	countries := self newDropList.
	code := self newText.
	info := self newLabel.
	flag := self newImage.
	map := self newRoassal.

	countries items: (self model countries values sort: [ :a :b | a name <= b name ]).
	info label: 'Selectionnez un pays'
]

{ #category : 'as yet unclassified' }
SpCountries >> onChange: anItem [

	code text: anItem code.
	flag image: anItem flag.
	map canvas
		clear;
		addShape: anItem asRSPath;
		zoomToFit
]
