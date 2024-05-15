Class {
	#name : 'Country',
	#superclass : 'Object',
	#instVars : [
		'name',
		'path',
		'color',
		'code',
		'flag'
	],
	#category : 'Ecole-Objects',
	#package : 'Ecole',
	#tag : 'Objects'
}

{ #category : 'converting' }
Country >> asRSPath [

	^ RSSVGPath new
		  paint: (self color ifNil: [ Color random alpha: 0.1 ]);
		  border: (RSBorder new paint: Color black);
		  svgPath: self path;
		model: self;
		  @ (RSPopup)
]

{ #category : 'accessing' }
Country >> code [
	^ code
]

{ #category : 'accessing' }
Country >> code: aString [ 
	code := aString
]

{ #category : 'accessing' }
Country >> color [
	color ifNotNil: [ ^ color].
	
	^ color := flag colors reject: [ :x | x isTransparent | (x = Color white) ]
	
]

{ #category : 'accessing' }
Country >> color: aColor [ 
	color := aColor
]

{ #category : 'as yet unclassified' }
Country >> flag [

	| request png |

	flag ifNotNil: [ ^flag ].

	request := ZnClient new.
	request get: 'https://flagcdn.com/w320/' , code asLowercase , '.png'.
	"checking success of request"
	request isSuccess ifFalse: [ self halt  ].
	"getting the png (as bytearray)"
	png := request response contents.
	
	flag := ImageReadWriter formFromStream: (ReadStream on: png).
	^flag
]

{ #category : 'as yet unclassified' }
Country >> inspectionFlag [

	<inspectorPresentationOrder: 1 title: 'Flag'>
	^ SpImagePresenter new
		  image: self flag;
		  yourself
]

{ #category : 'as yet unclassified' }
Country >> inspectionMap [

	<inspectorPresentationOrder: 0 title: 'Map'>
	| c |
	c := RSCanvas new
		     addShape: self asRSPath;
"		     zoomToFit;"
		 @ RSCanvasController.
	^ SpRoassalInspectorPresenter new
		  canvas: c;
		  yourself
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

{ #category : 'printing' }
Country >> printOn: aStream [
	aStream << name
]
