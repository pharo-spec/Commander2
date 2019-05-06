"
I am the implementation of the decorator design pattern for commands.
"
Class {
	#name : #LtCommandDecorator,
	#superclass : #LtAbstractCommand,
	#traits : 'LtTDecorator',
	#classTraits : 'LtTDecorator classTrait',
	#instVars : [
		'decoratedCommand'
	],
	#category : #'Lieutenant-Commands'
}

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

{ #category : #decorating }
LtCommandDecorator >> decorate: aLtCommand [
	self decoratedCommand: aLtCommand
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
