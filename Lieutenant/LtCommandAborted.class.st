"
I am raised when the execution of a command has been aborted.
"
Class {
	#name : #LtCommandAborted,
	#superclass : #LtCommandError,
	#instVars : [
		'reason'
	],
	#category : #'Lieutenant-Errors'
}

{ #category : #initialization }
LtCommandAborted >> initialize [
	super initialize.
	self
		reason: 'Unkown reason'
]

{ #category : #accessing }
LtCommandAborted >> reason [
	^ reason
]

{ #category : #accessing }
LtCommandAborted >> reason: anObject [
	reason := anObject
]
