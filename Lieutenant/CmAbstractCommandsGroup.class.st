Class {
	#name : #CmAbstractCommandsGroup,
	#superclass : #CmObject,
	#category : #'Lieutenant-Groups'
}

{ #category : #'public-api' }
CmAbstractCommandsGroup >> / aString [
	"Alias for #commandOrRegisterNamed:."
	^ self commandOrGroupNamed: aString
]

{ #category : #visiting }
CmAbstractCommandsGroup >> acceptVisitor: aLtCommandsRegisterVisitor [
	^ aLtCommandsRegisterVisitor visitLtCommandsGroup: self
]

{ #category : #accessing }
CmAbstractCommandsGroup >> allCommands [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
CmAbstractCommandsGroup >> commandOrGroupNamed: aString [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
CmAbstractCommandsGroup >> commands [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
CmAbstractCommandsGroup >> entries [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
CmAbstractCommandsGroup >> groups [
	^ self subclassResponsibility
]

{ #category : #testing }
CmAbstractCommandsGroup >> hasCommand: aLtCommand [
	^ self subclassResponsibility
]

{ #category : #testing }
CmAbstractCommandsGroup >> hasEntryNamed: aString [
	^ self subclassResponsibility
]

{ #category : #testing }
CmAbstractCommandsGroup >> isGroup [
	^ true
]

{ #category : #'public-api' }
CmAbstractCommandsGroup >> register: aLtCommandsOrRegister [
	^ self subclassResponsibility
]

{ #category : #'public-api' }
CmAbstractCommandsGroup >> unregister: aLtCommandOrRegister [
	^ self subclassResponsibility
]
