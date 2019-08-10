Extension { #name : #CmAbstractCommand }

{ #category : #'*Commander2-Deprecations' }
CmAbstractCommand >> canBeRun [
	self deprecated: 'Use #canBeExecuted instead.' transformWith: '`@receiver canBeRun' -> '`@receiver canBeExecuted'.
	^ self canBeExecuted
]
