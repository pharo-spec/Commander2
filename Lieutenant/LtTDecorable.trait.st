"
I implement methods that a decorable object understand.
"
Trait {
	#name : #LtTDecorable,
	#category : #'Lieutenant-Traits'
}

{ #category : #decorating }
LtTDecorable >> decorateWith: aDecorator [
	^ aDecorator decorate: self
]
