Extension { #name : #LtCommandAborted }

{ #category : #'*Lieutenant-Spec' }
LtCommandAborted >> actForSpec [
	UIManager default inform: ('"{1}" command was aborted because: {2}' format: { self command name . self reason })
]
