"
I am the implementation of the decorator design pattern for commands.
"
Class {
	#name : #LtCommandDecorator,
	#superclass : #LtCommand,
	#instVars : [
		'decoratedCommand'
	],
	#category : #Lieutenant
}

{ #category : #'instance creation' }
LtCommandDecorator class >> decorate: aLtCommand [
	"Created a command decorator decorating aLtCommand."
	^ self new
		decoratedCommand: aLtCommand;
		yourself
]

{ #category : #testing }
LtCommandDecorator >> canBeExecutedIn: anObject [
	^ self decoratedCommand canBeExecutedIn: anObject
]

{ #category : #accessing }
LtCommandDecorator >> context [
	^ self decoratedCommand context
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

{ #category : #accessing }
LtCommandDecorator >> description: aString [
	self decoratedCommand description: aString
]

{ #category : #execute }
LtCommandDecorator >> execute [
	self decoratedCommand execute
]

{ #category : #accessing }
LtCommandDecorator >> name [
	^ self decoratedCommand name
]

{ #category : #accessing }
LtCommandDecorator >> name: aString [
	self decoratedCommand name: aString
]
