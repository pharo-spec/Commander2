"
I am the implementation of the decorator design pattern for commands.
"
Class {
	#name : #LtCommandDecorator,
	#superclass : #LtCommand,
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

{ #category : #accessing }
LtCommandDecorator >> description [
	^ self decoratedCommand description
]

{ #category : #accessing }
LtCommandDecorator >> description: aString [
	self decoratedCommand description: aString
]

{ #category : #hooks }
LtCommandDecorator >> execute [
	self decoratedCommand execute
]

{ #category : #hooks }
LtCommandDecorator >> extractInformationFromContext: anObject [
	self decoratedCommand extractInformationFromContext: anObject
]

{ #category : #accessing }
LtCommandDecorator >> name [
	^ self decoratedCommand name
]

{ #category : #accessing }
LtCommandDecorator >> name: aString [
	self decoratedCommand name: aString
]
