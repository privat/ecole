Class {
	#name : 'Country',
	#superclass : 'Object',
	#instVars : [
		'name',
		'path',
		'color'
	],
	#category : 'Ecole-Objects',
	#package : 'Ecole',
	#tag : 'Objects'
}

{ #category : 'converting' }
Country >> asRSPath [

	^ (RSSVGPath new
		   paint: (self color ifNil: [ Color random alpha: 0.1 ]);
		   border: (RSBorder new paint: Color black);
		   svgPath: self path) @ (RSPopup text: self name)
]

{ #category : 'accessing' }
Country >> color [
	^ color
]

{ #category : 'accessing' }
Country >> color: aColor [ 
	color := aColor
]

{ #category : 'accessing' }
Country >> name [
	^ name
]

{ #category : 'accessing' }
Country >> name: aString [ 
	name := aString
]

{ #category : 'accessing' }
Country >> path [
	^ path
]

{ #category : 'accessing' }
Country >> path: aString [ 
	path := aString
]
