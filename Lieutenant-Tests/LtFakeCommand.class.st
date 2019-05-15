Class {
	#name : #LtFakeCommand,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Tests'
}

{ #category : #hooks }
LtFakeCommand >> canBeRun [
	^ self context = 42
]

{ #category : #accessing }
LtFakeCommand >> description [
	^ super description , ' ' , self context asString
]

{ #category : #initialization }
LtFakeCommand >> initialize [
	super initialize.
	self
		basicName: 'Fake command';
		basicDescription: 'I am a fake command for testing purposes.'
]

{ #category : #accessing }
LtFakeCommand >> name [
	^ super name , ' ' , self context asString
]
