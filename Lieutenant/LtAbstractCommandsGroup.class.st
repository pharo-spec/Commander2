Class {
	#name : #LtAbstractCommandsGroup,
	#superclass : #LtObject,
	#category : #'Lieutenant-Groups'
}

{ #category : #accessing }
LtAbstractCommandsGroup >> allCommands [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
LtAbstractCommandsGroup >> commandOrGroupNamed: aString [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
LtAbstractCommandsGroup >> commands [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
LtAbstractCommandsGroup >> entries [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
LtAbstractCommandsGroup >> groups [
	^ self subclassResponsibility
]

{ #category : #testing }
LtAbstractCommandsGroup >> hasCommand: aLtCommand [
	^ self subclassResponsibility
]

{ #category : #testing }
LtAbstractCommandsGroup >> hasEntryNamed: aString [
	^ self subclassResponsibility
]

{ #category : #testing }
LtAbstractCommandsGroup >> isGroup [
	^ true
]

{ #category : #'public-api' }
LtAbstractCommandsGroup >> register: aLtCommandsOrRegister [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
LtAbstractCommandsGroup >> unregister: aLtCommandOrRegister [
	^ self subclassResponsibility
]
