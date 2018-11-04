"
While other commands should be defined upfront, I'm a generic command. 
I execute a block as my action. 


"
Class {
	#name : #LtGenericCommand,
	#superclass : #LtCommand,
	#instVars : [
		'block'
	],
	#category : #Lieutenant
}

{ #category : #execution }
LtGenericCommand >> execute [

	block value
]
