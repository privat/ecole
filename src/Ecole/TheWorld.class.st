Class {
	#name : 'TheWorld',
	#superclass : 'Object',
	#instVars : [
		'countries'
	],
	#category : 'Ecole-Objects',
	#package : 'Ecole',
	#tag : 'Objects'
}

{ #category : 'as yet unclassified' }
TheWorld class >> defaultPath [
	^ '/home/privat/Téléchargements/world.svg'
]

{ #category : 'examples' }
TheWorld class >> example [

	self example: self defaultPath
]

{ #category : 'accessing' }
TheWorld class >> example: aPath [

	| w |
	w := TheWorld new loadFile: aPath.
	(w countries at: 'Italy') color: Color green.
	(w countries at: 'Canada') color: Color red.
	(w countries at: 'France') color: Color blue.
	^ w asCanvas @ RSCanvasController
]

{ #category : 'installing' }
TheWorld class >> load [
	^ self new loadFile: self defaultPath
]

{ #category : 'actions api' }
TheWorld >> asCanvas [

	| c |
	c := RSCanvas new.
	countries do: [ :p | c addShape: p asRSPath ].
	^ c
]

{ #category : 'accessing' }
TheWorld >> countries [
	^ countries
]

{ #category : 'actions api' }
TheWorld >> loadFile: aPath [

	| xml |
	xml := XMLDOMParser parse: aPath asFileReference.

	countries := Dictionary new.

	xml allElementsNamed: 'path' do: [ :p |
		countries at: (p attributeAt: 'title') put: (Country new
				 name: (p attributeAt: 'title');
				 path: (p attributeAt: 'd')) ]
]
