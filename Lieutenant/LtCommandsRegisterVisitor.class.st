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
	^ aLtCommandsRegister entries collect: [ :entry |
		entry acceptVisitor: self ]
]

{ #category : #visiting }
LtCommandsRegisterVisitor >> visitLtRegisterEntry: aLtRegisterEntry [
	^ aLtRegisterEntry register acceptVisitor: self
]
