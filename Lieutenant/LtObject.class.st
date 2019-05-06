Class {
	#name : #LtObject,
	#superclass : #Object,
	#category : #'Lieutenant-Core'
}

{ #category : #accessing }
LtObject >> basicDescription [
	^ self subclassResponsibility
]

{ #category : #accessing }
LtObject >> basicDescription: aString [
	^ self subclassResponsibility
]

{ #category : #accessing }
LtObject >> basicName [
	^ self subclassResponsibility
]

{ #category : #accessing }
LtObject >> basicName: aString [
	^ self subclassResponsibility
]

{ #category : #testing }
LtObject >> isCommand [
	^ false
]

{ #category : #testing }
LtObject >> isGroup [
	^ false
]
