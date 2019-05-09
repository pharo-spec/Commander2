Extension { #name : #LtRequest }

{ #category : #'*Lieutenant-Spec' }
LtRequest >> actForSpec [
	| answer |
	answer := UIManager default 
		request: self request
		initialAnswer: self initialAnswer
		title: self title.
	
	answer isEmptyOrNil
		ifTrue: [ LtCommandAborted signal ].
	
	self whenAnsweredBlock value: self command value: answer.
	
	self resume
]
