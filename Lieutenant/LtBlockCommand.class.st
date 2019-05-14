"
While other commands actions should be defined by overriding #execute method, I'm a block command. 
I  execute a block as my action.

"
Class {
	#name : #LtBlockCommand,
	#superclass : #LtCommand,
	#instVars : [
		'block',
		'canBeRunBlock'
	],
	#category : #'Lieutenant-Commands'
}

{ #category : #accessing }
LtBlockCommand >> block [
	^ block
]

{ #category : #accessing }
LtBlockCommand >> block: anObject [
	block := anObject
]

{ #category : #hooks }
LtBlockCommand >> canBeRun [
	self hasContext "When no context is set, we consider the command to be runnable. So we call super."
		ifFalse: [ ^ super canBeRun ].
		
	^ block value: self context
]

{ #category : #accessing }
LtBlockCommand >> canBeRunBlock [
	^ canBeRunBlock
]

{ #category : #accessing }
LtBlockCommand >> canBeRunBlock: anObject [
	canBeRunBlock := anObject
]

{ #category : #execution }
LtBlockCommand >> execute [
	self hasContext
		ifTrue: [ block value: self context ]
		ifFalse: [ block value ]
]

{ #category : #initialization }
LtBlockCommand >> initialize [
	super initialize.
	self canBeRunBlock: [ :ctxt | true ]
]
