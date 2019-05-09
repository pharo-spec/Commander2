Class {
	#name : #LtRequest,
	#superclass : #LtCommandNotication,
	#instVars : [
		'request',
		'initialAnswer',
		'title',
		'whenAnsweredBlock'
	],
	#category : #'Lieutenant-Notifications'
}

{ #category : #accessing }
LtRequest >> initialAnswer [
	^ initialAnswer
]

{ #category : #accessing }
LtRequest >> initialAnswer: anObject [
	initialAnswer := anObject
]

{ #category : #initialization }
LtRequest >> initialize [
	super initialize.
	self
		title: 'Untitled request';
		request: 'Question is not specified';
		initialAnswer: '';
		whenAnsweredBlock: [ :commandContext :answer | ]
]

{ #category : #accessing }
LtRequest >> request [
	^ request
]

{ #category : #accessing }
LtRequest >> request: anObject [
	request := anObject
]

{ #category : #accessing }
LtRequest >> title [
	^ title
]

{ #category : #accessing }
LtRequest >> title: anObject [
	title := anObject
]

{ #category : #accessing }
LtRequest >> whenAnsweredBlock [
	^ whenAnsweredBlock
]

{ #category : #accessing }
LtRequest >> whenAnsweredBlock: anObject [
	whenAnsweredBlock := anObject
]
