"
I am the implementation of the visitor design pattern for commands register.

I am abstract, my subclasses should implement #visitLtCommandEntry:.

I define default behaviour for visiting a commands register and a register entry.
"
Class {
	#name : #LtCommandsGroupVisitor,
	#superclass : #Object,
	#category : #'Lieutenant-Visitors'
}

{ #category : #visiting }
LtCommandsGroupVisitor >> visitLtCommand: aLtCommandEntry [
	^ self subclassResponsibility
]

{ #category : #visiting }
LtCommandsGroupVisitor >> visitLtCommandsGroup: aLtCommandsGroup [
	^ aLtCommandsGroup entries collect: [ :entry |
		entry acceptVisitor: self ]
]

{ #category : #visiting }
LtCommandsGroupVisitor >> visitLtRegister: aLtRegister [
	^ aLtRegister acceptVisitor: self
]
