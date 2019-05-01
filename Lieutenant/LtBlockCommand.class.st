"
While other commands actions should be defined by overriding #execute method, I''m a block command. 
I  execute a block as my action. 

[[[ 
LtBlockCommand new 
   name: 'on the fly';
   shortkey: 'A' asKeyCombination;
   block: [ Smalltalk beep ]
]]]


"
Class {
	#name : #LtBlockCommand,
	#superclass : #LtCommand,
	#instVars : [
		'block'
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

{ #category : #execution }
LtBlockCommand >> execute [
	self hasContext
		ifTrue: [ block value: self context ]
		ifFalse: [ block value ]
]
