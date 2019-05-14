Extension { #name : #InteractionError }

{ #category : #'*Lieutenant-Spec' }
InteractionError >> actForSpec [
	"Override this method to define the behaviour of when an interaction error occurs."
	self subclassResponsibility
]
