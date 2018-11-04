"
While other commands should be defined upfront, I'm a generic command. 
I execute a block as my action. 

[[[ 
LtGenericCommand new 
   name: 'on the fly';
   shortkey: 'A';
   block: [ Smalltalk beep ]
]]]


"
Class {
	#name : #LtGenericCommand,
	#superclass : #LtCommand,
	#instVars : [
		'block'
	],
	#category : #Lieutenant
}

{ #category : #accessing }
LtGenericCommand >> block [
	^ block
]

{ #category : #accessing }
LtGenericCommand >> block: anObject [
	block := anObject
]

{ #category : #execution }
LtGenericCommand >> execute [

	block value
]
