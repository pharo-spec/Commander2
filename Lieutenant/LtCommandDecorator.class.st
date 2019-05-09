"
I am the implementation of the decorator design pattern for commands.

I just delegate everything to the #decoratedCommand. My subclasses probably do something more interesting.
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

{ #category : #testing }
LtCommandDecorator >> canBeRun [
	"This hook allows the command decide if it can be run with the context it holds or not.
	 It should return a boolean.
	"
	^ self decoratedCommand canBeRun
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

{ #category : #accessing }
LtCommandDecorator >> description [
	^ self decoratedCommand description
]

{ #category : #hooks }
LtCommandDecorator >> execute [
	self decoratedCommand execute
]

{ #category : #accessing }
LtCommandDecorator >> name [
	^ self decoratedCommand name
]
