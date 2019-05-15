Class {
	#name : #CmCommandsGroupDecorator,
	#superclass : #CmAbstractCommandsGroup,
	#traits : 'CmTDecorator',
	#classTraits : 'CmTDecorator classTrait',
	#instVars : [
		'decoratedGroup'
	],
	#category : #'Lieutenant-Groups'
}

{ #category : #accessing }
CmCommandsGroupDecorator >> allCommands [
	^ self decoratedGroup allCommands
]

{ #category : #accessing }
CmCommandsGroupDecorator >> basicDescription [
	^ self decoratedGroup basicDescription
]

{ #category : #accessing }
CmCommandsGroupDecorator >> basicDescription: aString [
	self decoratedGroup basicDescription: aString
]

{ #category : #accessing }
CmCommandsGroupDecorator >> basicName [
	^ self decoratedGroup basicName
]

{ #category : #accessing }
CmCommandsGroupDecorator >> basicName: aString [
	self decoratedGroup basicName: aString
]

{ #category : #'public-api' }
CmCommandsGroupDecorator >> commandOrGroupNamed: aString [
	^ self decoratedGroup commandOrGroupNamed: aString
]

{ #category : #'public-api' }
CmCommandsGroupDecorator >> commands [
	^ self decoratedGroup commands
]

{ #category : #decorating }
CmCommandsGroupDecorator >> decorate: aLtCommandsGroup [
	self decoratedGroup: aLtCommandsGroup
]

{ #category : #accessing }
CmCommandsGroupDecorator >> decoratedGroup [
	^ decoratedGroup
]

{ #category : #accessing }
CmCommandsGroupDecorator >> decoratedGroup: anObject [
	decoratedGroup := anObject
]

{ #category : #accessing }
CmCommandsGroupDecorator >> description [
	^ self decoratedGroup description
]

{ #category : #'public-api' }
CmCommandsGroupDecorator >> entries [
	^ self decoratedGroup entries
]

{ #category : #'public-api' }
CmCommandsGroupDecorator >> groups [
	^ self decoratedGroup groups
]

{ #category : #testing }
CmCommandsGroupDecorator >> hasCommand: aLtCommand [
	^ self decoratedGroup hasCommand: aLtCommand
]

{ #category : #testing }
CmCommandsGroupDecorator >> hasEntryNamed: aString [
	^ self decoratedGroup hasEntryNamed: aString
]

{ #category : #accessing }
CmCommandsGroupDecorator >> name [
	^ self decoratedGroup name
]

{ #category : #'public-api' }
CmCommandsGroupDecorator >> register: aLtCommandsOrRegister [
	self decoratedGroup register: aLtCommandsOrRegister
]

{ #category : #'public-api' }
CmCommandsGroupDecorator >> unregister: aLtCommandOrRegister [
	^ self decoratedGroup unregister: aLtCommandOrRegister
]
