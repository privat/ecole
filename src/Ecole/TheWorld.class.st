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
