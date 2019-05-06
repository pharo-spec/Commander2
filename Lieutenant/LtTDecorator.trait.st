"
I implement methods that a decorator object understand.
"
Trait {
	#name : #LtTDecorator,
	#category : #'Lieutenant-Traits'
}

{ #category : #'instance creation' }
LtTDecorator classSide >> decorate: anObject [
	"Create a decorator decorating anObject."
	^ self new
		decorate: anObject;
		yourself
]

{ #category : #decorating }
LtTDecorator >> decorate: anObject [
	"Decorate anObject. To be defined by users of this trait."
	self explicitRequirement
]
