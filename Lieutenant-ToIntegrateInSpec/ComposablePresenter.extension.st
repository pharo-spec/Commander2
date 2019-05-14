Extension { #name : #ComposablePresenter }

{ #category : #'*Lieutenant-ToIntegrateInSpec' }
ComposablePresenter >> request: request initialAnswer: initialAnwser title: title [
	| answer |
	answer := UIManager default 
					request: request
					initialAnswer: initialAnwser
					title: title.
					
	answer "If this is nil, it means that user cancelled the UI."
		ifNil: [ InteractionCancelled signal ].
	
	^ answer
]
