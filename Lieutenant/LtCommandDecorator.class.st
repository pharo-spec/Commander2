"
I am the implementation of the decorator design pattern for commands.
"
Class {
	#name : #LtCommandDecorator,
	#superclass : #LtAbstractCommand,
	#instVars : [
		'decoratedCommand'
	],
	#category : #'Lieutenant-Commands'
}

{ #category : #'instance creation' }
LtCommandDecorator class >> decorate: aLtCommand [
	"Created a command decorator decorating aLtCommand."
	^ self new
		decoratedCommand: aLtCommand;
		yourself
]

{ #category : #visiting }
LtCommandDecorator >> acceptVisitor: aLtCommandsRegisterVisitor [
	^ aLtCommandsRegisterVisitor visitLtCommand: self decoratedCommand
]

{ #category : #accessing }
LtCommandDecorator >> basicDescription [
	^ self decoratedCommand basicDescription
]

{ #category : #accessing }
LtCommandDecorator >> basicDescription: aString [
	self decoratedCommand basicDescription: aString
]

{ #category : #accessing }
LtCommandDecorator >> basicName [
	^ self decoratedCommand basicName
]

{ #category : #accessing }
LtCommandDecorator >> basicName: aString [
	self decoratedCommand basicName: aString
]

{ #category : #hooks }
LtCommandDecorator >> canBeRunOn: anObject [
	^ self decoratedCommand canBeRunOn: anObject
]

{ #category : #accessing }
LtCommandDecorator >> context [
	^ self decoratedCommand context
]

{ #category : #accessing }
LtCommandDecorator >> context: anObject [
	self decoratedCommand context: anObject
]

{ #category : #accessing }
LtCommandDecorator >> decoratedCommand [
	^ decoratedCommand
]

{ #category : #accessing }
LtCommandDecorator >> decoratedCommand: anObject [
	decoratedCommand := anObject
]

{ #category : #hooks }
LtCommandDecorator >> execute [
	self decoratedCommand execute
]

{ #category : #accessing }
LtCommandDecorator >> name [
	^ self decoratedCommand name
]
