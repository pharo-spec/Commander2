Class {
	#name : #LtSpecCommandGroup,
	#superclass : #LtCommandsGroupDecorator,
	#instVars : [
		'iconName'
	],
	#category : #'Lieutenant-Spec'
}

{ #category : #accessing }
LtSpecCommandGroup >> iconName [
	^ iconName
]

{ #category : #accessing }
LtSpecCommandGroup >> iconName: anObject [
	iconName := anObject
]
