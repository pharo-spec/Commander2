"
I am an abstract entry for an object that can be stored in a command registry.

I only define the interface any entry should understand.

My concrete subclasses should implement all my abstract methods.
"
Class {
	#name : #LtEntry,
	#superclass : #Object,
	#category : #'Lieutenant-Register'
}

{ #category : #accessing }
LtEntry >> basicName [
	"Returns the name that allows to identify this entry uniquely in the register."
	^ self subclassResponsibility
]

{ #category : #testing }
LtEntry >> isCommand [
	^ false
]

{ #category : #testing }
LtEntry >> isRegister [
	^ false
]

{ #category : #accessing }
LtEntry >> wrappedObject [
	"Returns the object that is wrapped by myself."
	^ self subclassResponsibility
]
