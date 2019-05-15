Extension { #name : #CmCommandAborted }

{ #category : #'*Commander2-Spec' }
CmCommandAborted >> actForSpec [
	UIManager default inform: ('"{1}" command was aborted because: {2}' format: { self command name . self reason })
]
