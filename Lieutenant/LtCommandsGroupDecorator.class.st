Class {
	#name : #LtCommandsGroupDecorator,
	#superclass : #LtObject,
	#instVars : [
		'decoratedGroup'
	],
	#category : #'Lieutenant-Groups'
}

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

{ #category : #accessing }
LtCommandsGroupDecorator >> decoratedGroup [
	^ decoratedGroup
]

{ #category : #accessing }
LtCommandsGroupDecorator >> decoratedGroup: anObject [
	decoratedGroup := anObject
]
