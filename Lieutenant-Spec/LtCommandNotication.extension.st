Extension { #name : #LtCommandNotication }

{ #category : #'*Lieutenant-Spec' }
LtCommandNotication >> actForSpec [
	"Defines the interactions with user to be done through UI when the notification is signaled."
	self subclassResponsibility
]
