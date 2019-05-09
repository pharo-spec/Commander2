Class {
	#name : #LtCommandNotication,
	#superclass : #Notification,
	#instVars : [
		'command'
	],
	#category : #'Lieutenant-Notifications'
}

{ #category : #accessing }
LtCommandNotication class >> command: anObject [
	^ self new
		command: anObject;
		yourself
]

{ #category : #accessing }
LtCommandNotication >> command [
	^ command
]

{ #category : #accessing }
LtCommandNotication >> command: anObject [
	command := anObject
]
