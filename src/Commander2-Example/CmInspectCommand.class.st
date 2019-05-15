Class {
	#name : #CmInspectCommand,
	#superclass : #CmCommand,
	#category : #'Commander2-Example'
}

{ #category : #hooks }
CmInspectCommand >> execute [
	self context inspect
]

{ #category : #initialization }
CmInspectCommand >> initialize [
	super initialize.
	self
		basicName: 'Inspect';
		basicDescription: 'Inspect the context of this command.'
]
