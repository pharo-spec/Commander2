Class {
	#name : #LtRegisterEntry,
	#superclass : #LtEntry,
	#instVars : [
		'register'
	],
	#category : #'Lieutenant-Register'
}

{ #category : #'instance creation' }
LtRegisterEntry class >> register: aLtCommandsRegister [
	^ self new
		register: aLtCommandsRegister;
		yourself
]

{ #category : #testing }
LtRegisterEntry >> isRegister [
	^ true
]

{ #category : #accessing }
LtRegisterEntry >> name [
	^ self register name
]

{ #category : #accessing }
LtRegisterEntry >> register [
	^ register
]

{ #category : #accessing }
LtRegisterEntry >> register: aLtCommandsRegister [
	register := aLtCommandsRegister
]

{ #category : #accessing }
LtRegisterEntry >> wrappedObject [
	^ self register
]
