"
I am an entry in the register that stores a command.

Additionally to the command, I store a block that returns the context to use when the command is run.
"
Class {
	#name : #LtCommandEntry,
	#superclass : #LtEntry,
	#instVars : [
		'command',
		'contextBlock'
	],
	#category : #'Lieutenant-Register'
}

{ #category : #'instance creation' }
LtCommandEntry class >> command: aLtCommand contextBlock: aBlock [
	^ self new
		command: aLtCommand;
		contextBlock: aBlock;
		yourself
]

{ #category : #visiting }
LtCommandEntry >> acceptVisitor: aLtCommandsRegisterVisitor [
	^ aLtCommandsRegisterVisitor visitLtCommandEntry: self
]

{ #category : #accessing }
LtCommandEntry >> basicName [
	^ self command basicName
]

{ #category : #accessing }
LtCommandEntry >> command [
	^ command
]

{ #category : #accessing }
LtCommandEntry >> command: aLtCommand [
	command := aLtCommand
]

{ #category : #accessing }
LtCommandEntry >> context [
	^ self contextBlock value
]

{ #category : #accessing }
LtCommandEntry >> contextBlock [
	^ contextBlock
]

{ #category : #accessing }
LtCommandEntry >> contextBlock: aBlock [
	contextBlock := aBlock
]

{ #category : #testing }
LtCommandEntry >> isCommand [
	^ true
]

{ #category : #accessing }
LtCommandEntry >> wrappedObject [
	^ self command
]
