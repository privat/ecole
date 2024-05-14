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

{ #category : 'accessing' }
Country >> color [
	^ color
]

{ #category : 'accessing' }
Country >> color: aColor [ 
	color := aColor
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
