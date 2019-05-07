Class {
	#name : #LtCommandsGroupDecorator,
	#superclass : #LtAbstractCommandsGroup,
	#traits : 'LtTDecorator',
	#classTraits : 'LtTDecorator classTrait',
	#instVars : [
		'decoratedGroup'
	],
	#category : #'Lieutenant-Groups'
}

{ #category : #accessing }
LtCommandsGroupDecorator >> allCommands [
	^ self decoratedGroup allCommands
]

{ #category : #accessing }
LtCommandsGroupDecorator >> basicDescription [
	^ self decoratedGroup basicDescription
]

{ #category : #accessing }
LtCommandsGroupDecorator >> basicDescription: aString [
	self decoratedGroup basicDescription: aString
]

{ #category : #accessing }
LtCommandsGroupDecorator >> basicName [
	^ self decoratedGroup basicName
]

{ #category : #accessing }
LtCommandsGroupDecorator >> basicName: aString [
	self decoratedGroup basicName: aString
]

{ #category : #'public-api' }
LtCommandsGroupDecorator >> commandOrGroupNamed: aString [
	^ self decoratedGroup commandOrGroupNamed: aString
]

{ #category : #'public-api' }
LtCommandsGroupDecorator >> commands [
	^ self decoratedGroup commands
]

{ #category : #decorating }
LtCommandsGroupDecorator >> decorate: aLtCommandsGroup [
	self decoratedGroup: aLtCommandsGroup
]

{ #category : #accessing }
LtCommandsGroupDecorator >> decoratedGroup [
	^ decoratedGroup
]

{ #category : #accessing }
LtCommandsGroupDecorator >> decoratedGroup: anObject [
	decoratedGroup := anObject
]

{ #category : #accessing }
LtCommandsGroupDecorator >> description [
	^ self decoratedGroup description
]

{ #category : #'public-api' }
LtCommandsGroupDecorator >> entries [
	^ self decoratedGroup entries
]

{ #category : #'public-api' }
LtCommandsGroupDecorator >> groups [
	^ self decoratedGroup groups
]

{ #category : #testing }
LtCommandsGroupDecorator >> hasCommand: aLtCommand [
	^ self decoratedGroup hasCommand: aLtCommand
]

{ #category : #testing }
LtCommandsGroupDecorator >> hasEntryNamed: aString [
	^ self decoratedGroup hasEntryNamed: aString
]

{ #category : #accessing }
LtCommandsGroupDecorator >> name [
	^ self decoratedGroup name
]

{ #category : #'public-api' }
LtCommandsGroupDecorator >> register: aLtCommandsOrRegister [
	^ self decoratedGroup register: aLtCommandsOrRegister
]

{ #category : #'public-api' }
LtCommandsGroupDecorator >> unregister: aLtCommandOrRegister [
	^ self decoratedGroup unregister: aLtCommandOrRegister
]
