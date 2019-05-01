Class {
	#name : #LtCommandsRegisterVisitor,
	#superclass : #Object,
	#category : #'Lieutenant-Register'
}

{ #category : #visiting }
LtCommandsRegisterVisitor >> visitLtCommandEntry: aLtCommandEntry [
	^ self subclassResponsibility
]

{ #category : #visiting }
LtCommandsRegisterVisitor >> visitLtCommandsRegister: aLtCommandsRegister [
	^ self subclassResponsibility
]

{ #category : #visiting }
LtCommandsRegisterVisitor >> visitLtRegisterEntry: aLtRegisterEntry [
	^ self subclassResponsibility
]
