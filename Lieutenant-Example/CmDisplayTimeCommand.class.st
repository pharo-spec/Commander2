Class {
	#name : #CmDisplayTimeCommand,
	#superclass : #CmCommand,
	#category : #'Lieutenant-Example'
}

{ #category : #hooks }
CmDisplayTimeCommand >> execute [
	UIManager default inform: self context asString
]

{ #category : #initialization }
CmDisplayTimeCommand >> initialize [
	super initialize.
	self
		basicName: 'Display current time';
		basicDescription: 'I display the time according to my context.'
]

{ #category : #hooks }
CmDisplayTimeCommand >> name [
	^ 'I display the time (currently: {1})' format: { self context asString }
]
