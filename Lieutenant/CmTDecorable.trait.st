"
I implement methods that a decorable object understand.
"
Trait {
	#name : #CmTDecorable,
	#category : #'Lieutenant-Traits'
}

{ #category : #decorating }
CmTDecorable >> decorateWith: aDecorator [
	^ aDecorator decorate: self
]
