Class {
	#name : #LtEntry,
	#superclass : #Object,
	#category : #'Lieutenant-Register'
}

{ #category : #testing }
LtEntry >> isCommand [
	^ false
]

{ #category : #testing }
LtEntry >> isRegister [
	^ false
]

{ #category : #accessing }
LtEntry >> name [
	^ self subclassResponsibility
]

{ #category : #accessing }
LtEntry >> wrappedObject [
	^ self subclassResponsibility
]
