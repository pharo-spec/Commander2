Class {
	#name : #LtInspectCommand,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Example'
}

{ #category : #hooks }
LtInspectCommand >> execute [
	self context inspect
]
