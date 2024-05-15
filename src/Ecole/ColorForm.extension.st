Extension { #name : 'ColorForm' }

{ #category : '*Ecole' }
ColorForm >> colorsBag [
	"Return a list of the colors actually used by this ColorForm."

	| myColor list |
	myColor := self colors.
	list := Bag new.
	self tallyPixelValues doWithIndex: [:count :i |
		list add: (myColor at: i)].
	^ list
]
