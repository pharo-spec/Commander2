Extension { #name : #InteractionCancelled }

{ #category : #'*Commander2-Spec' }
InteractionCancelled >> actForSpec [
	"Does nothing on purpose."
	self flag: #TODO. "In the best world, we should delegate the behaviour to the Spec presenter which originated the error."
]
