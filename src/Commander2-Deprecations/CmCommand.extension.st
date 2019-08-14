Extension { #name : #CmCommand }

{ #category : #'*Commander2-Deprecations' }
CmCommand class >> defaultCommandName [ 
	self deprecated: 'Use #defaultName instead.' transformWith: '`@receiver defaultCommandName' -> '`@receiver defaultName'.
	^ self defaultName
]

{ #category : #'*Commander2-Deprecations' }
CmCommand class >> runWith: anObject [
 	self new runWith: anObject
]
