Class {
	#name : #LtSpecCommandGroup,
	#superclass : #LtCommandsGroupDecorator,
	#instVars : [
		'iconName'
	],
	#category : #'Lieutenant-Spec'
}

{ #category : #initialization }
LtSpecCommandGroup class >> defaultIconName [
	^ #blank
]

{ #category : #accessing }
LtSpecCommandGroup >> iconName [
	^ iconName
]

{ #category : #accessing }
LtSpecCommandGroup >> iconName: anObject [
	iconName := anObject
]

{ #category : #initialization }
LtSpecCommandGroup >> initialize [
	super initialize.
	self iconName: self class defaultIconName
]
