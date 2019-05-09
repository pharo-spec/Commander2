Extension { #name : #LtRequest }

{ #category : #'*Lieutenant-Spec' }
LtRequest >> actForSpec [
	| answer |
	answer := UIManager default 
		request: self request
		initialAnswer: self initialAnswer
		title: self title.
	
	answer isEmptyOrNil "If this is true, it means that user cancelled the UI."
		ifTrue: [ ^ self ].
	
	self whenAnsweredBlock value: self command value: answer.
	
	self resume
]
