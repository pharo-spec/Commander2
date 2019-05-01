"
I am the implementation of the visitor design pattern for commands register.

I am abstract, my subclasses should implement #visitLtCommandEntry:.

I define default behaviour for visiting a commands register and a register entry.
"
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
