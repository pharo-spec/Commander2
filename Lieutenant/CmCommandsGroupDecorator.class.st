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
CmCommandsGroupDecorator >> decorate: aCmCommandsGroup [
	self decoratedGroup: aCmCommandsGroup
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
CmCommandsGroupDecorator >> hasCommand: aCmCommand [
	^ self decoratedGroup hasCommand: aCmCommand
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
CmCommandsGroupDecorator >> register: aCmCommandOrGroup [
	self decoratedGroup register: aCmCommandOrGroup
]

{ #category : #'public-api' }
CmCommandsGroupDecorator >> unregister: aCmCommandOrGroup [
	^ self decoratedGroup unregister: aCmCommandOrGroup
]
