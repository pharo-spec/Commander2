Extension { #name : #CmBlockCommand }

{ #category : #'*Commander2-Deprecations' }
CmBlockCommand >> canBeRunBlock [
	self deprecated: 'Use #canBeExecutedBlock instead.' transformWith: '`@receiver canBeRunBlock' -> '`@receiver canBeExecutedBlock'.
	^ self canBeExecutedBlock
]

{ #category : #'*Commander2-Deprecations' }
CmBlockCommand >> canBeRunBlock: anObject [
	self deprecated: 'Use #canBeExecutedBlock: instead.' transformWith: '`@receiver canBeRunBlock: `@arg' -> '`@receiver canBeExecutedBlock: `@arg'.
	self canBeExecutedBlock: anObject
]
