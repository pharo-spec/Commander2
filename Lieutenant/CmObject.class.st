"
I am an abstract class defining the API that should be understood by any command or command group.
"
Class {
	#name : #CmObject,
	#superclass : #Object,
	#category : #'Lieutenant-Core'
}

{ #category : #accessing }
CmObject >> basicDescription [
	^ self subclassResponsibility
]

{ #category : #accessing }
CmObject >> basicDescription: aString [
	^ self subclassResponsibility
]

{ #category : #accessing }
CmObject >> basicName [
	^ self subclassResponsibility
]

{ #category : #accessing }
CmObject >> basicName: aString [
	^ self subclassResponsibility
]

{ #category : #testing }
CmObject >> isCommand [
	^ false
]

{ #category : #testing }
CmObject >> isGroup [
	^ false
]
