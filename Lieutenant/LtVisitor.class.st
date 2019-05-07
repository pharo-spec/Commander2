"
I am the implementation of the visitor design pattern for commands and commands group.

I am abstract, my subclasses should at least implement #visitLtCommand:.

I define default behaviour for visiting a commands groups.
"
Class {
	#name : #LtVisitor,
	#superclass : #Object,
	#category : #'Lieutenant-Visitors'
}

{ #category : #visiting }
LtVisitor >> visit: anObject [
	^ anObject acceptVisitor: self
]

{ #category : #visiting }
LtVisitor >> visitLtCommand: aLtCommandEntry [
	^ self subclassResponsibility
]

{ #category : #visiting }
LtVisitor >> visitLtCommandsGroup: aLtCommandsGroup [
	^ aLtCommandsGroup entries collect: [ :entry |
		entry acceptVisitor: self ]
]
