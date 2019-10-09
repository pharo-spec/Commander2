"
I implement methods that a decorable object understand.
"
Trait {
	#name : #CmTDecorable,
	#category : #'Commander2-Traits'
}

{ #category : #decorating }
CmTDecorable >> decorateWith: aDecoratorClass [
	^ aDecoratorClass decorate: self
]
