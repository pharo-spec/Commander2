"
I am an entry in the register that stores a sub-register.

One can access the sub-register through my accessor #register.
"
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

{ #category : #visiting }
LtRegisterEntry >> acceptVisitor: aLtCommandsRegisterVisitor [
	^ aLtCommandsRegisterVisitor visitLtRegisterEntry: self
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
