Extension { #name : #CmCommandAborted }

{ #category : #'*Lieutenant-Spec' }
CmCommandAborted >> actForSpec [
	UIManager default inform: ('"{1}" command was aborted because: {2}' format: { self command name . self reason })
]
