"
I am an abstract class defining the API a command should understand.

See my subclasses for concrete examples.
"
Class {
	#name : #LtAbstractCommand,
	#superclass : #LtObject,
	#category : #'Lieutenant-Commands'
}

{ #category : #visiting }
LtAbstractCommand >> acceptVisitor: aLtCommandsRegisterVisitor [
	^ aLtCommandsRegisterVisitor visitLtCommand: self
]

{ #category : #testing }
LtAbstractCommand >> canBeRun [
	"This hook allows the command decide if it can be run with the context it holds or not.
	 It should return a boolean.
	"
	^ self subclassResponsibility
]

{ #category : #accessing }
LtAbstractCommand >> context [
	^ self subclassResponsibility
]

{ #category : #accessing }
LtAbstractCommand >> context: anObject [
	^ self subclassResponsibility
]

{ #category : #hooks }
LtAbstractCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	self subclassResponsibility
]

{ #category : #testing }
LtAbstractCommand >> isCommand [
	^ true
]
