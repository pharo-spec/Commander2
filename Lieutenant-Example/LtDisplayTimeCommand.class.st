Class {
	#name : #LtDisplayTimeCommand,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Example'
}

{ #category : #hooks }
LtDisplayTimeCommand >> execute [
	UIManager default inform: self context asString
]

{ #category : #initialization }
LtDisplayTimeCommand >> initialize [
	super initialize.
	self
		basicName: 'Display current time';
		basicDescription: 'I display the time according to my context.'
]

{ #category : #hooks }
LtDisplayTimeCommand >> name [
	^ 'I display the time (currently: {1})' format: { self context asString }
]
