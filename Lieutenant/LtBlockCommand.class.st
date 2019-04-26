"
While other commands actions should be defined by overriding #execute method, I''m a block command. 
I  execute a block as my action. 

[[[ 
LtGenericCommand new 
   name: 'on the fly';
   shortkey: 'A';
   block: [ Smalltalk beep ]
]]]


"
Class {
	#name : #LtBlockCommand,
	#superclass : #LtCommand,
	#instVars : [
		'block'
	],
	#category : #Lieutenant
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

	block value
]
