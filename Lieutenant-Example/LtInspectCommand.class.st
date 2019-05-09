Class {
	#name : #LtInspectCommand,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Example'
}

{ #category : #hooks }
LtInspectCommand >> execute [
	self context inspect
]

{ #category : #initialization }
LtInspectCommand >> initialize [
	super initialize.
	self
		basicName: 'Inspect';
		basicDescription: 'Inspect the context of this command.'
]
