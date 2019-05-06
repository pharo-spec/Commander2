Class {
	#name : #LtAbstractCommand,
	#superclass : #Object,
	#category : #'Lieutenant-Commands'
}

{ #category : #decorating }
LtAbstractCommand >> asSpecCommand [
	"Subclasses might override this method to define default icon and shortcut."
	^ self decorateWith: LtSpecCommand
]

{ #category : #decorating }
LtAbstractCommand >> asSpecCommandWithIconNamed: aSymbol [
	^ self asSpecCommandWithIconNamed: aSymbol shortcutKey: nil
]

{ #category : #decorating }
LtAbstractCommand >> asSpecCommandWithIconNamed: aSymbol shortcutKey: aKMKeyCombination [
	^ (self decorateWith: LtSpecCommand)
		iconName: aSymbol;
		shortcutKey: aKMKeyCombination
]

{ #category : #accessing }
LtAbstractCommand >> basicName [
	^ self subclassResponsibility
]

{ #category : #accessing }
LtAbstractCommand >> basicName: aString [
	^ self subclassResponsibility
]

{ #category : #testing }
LtAbstractCommand >> canBeRunOn: anObject [
	"This hook allows the command decide if it can be run on anObject or not.
	 It should return a boolean. By default, returns true.
	"
	^ self subclassResponsibility
]

{ #category : #accessing }
LtAbstractCommand >> context [
	^ self subclassResponsibility
]

{ #category : #accessing }
LtAbstractCommand >> context: anObject [
	^ self subclassResponsibility
]

{ #category : #decorating }
LtAbstractCommand >> decorateWith: aLtCommandDecoratorClass [
	^ aLtCommandDecoratorClass decorate: self
]

{ #category : #accessing }
LtAbstractCommand >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
LtAbstractCommand >> description: aString [
	^ self subclassResponsibility
]

{ #category : #hooks }
LtAbstractCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	self subclassResponsibility
]

{ #category : #testing }
LtAbstractCommand >> isCommand [
	^ true
]

{ #category : #testing }
LtAbstractCommand >> isRegister [
	^ false
]

{ #category : #accessing }
LtAbstractCommand >> name [
	^ self decoratedCommand name
]
