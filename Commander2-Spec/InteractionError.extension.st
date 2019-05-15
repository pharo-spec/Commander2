Extension { #name : #InteractionError }

{ #category : #'*Commander2-Spec' }
InteractionError >> actForSpec [
	"Override this method to define the behaviour of when an interaction error occurs."
	self subclassResponsibility
]
