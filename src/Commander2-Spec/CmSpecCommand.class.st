"
I am a command decorator adding informations useful when for usage in context of a Spec application.

Basically, I add:
- an #icon (#blank by default)
- a #shortcutKey (optional)
"
Class {
	#name : #CmSpecCommand,
	#superclass : #CmCommandDecorator,
	#instVars : [
		'iconProvider',
		'iconName',
		'shortcutKey',
		'displayStrategy'
	],
	#category : #'Commander2-Spec-Core'
}

{ #category : #configuring }
CmSpecCommand >> beDisabledWhenCantBeRun [
	self displayStrategy: CmDisableWhenCantBeRun new
]

{ #category : #configuring }
CmSpecCommand >> beHiddenWhenCantBeRun [
	self displayStrategy: CmHideWhenCantBeRun new
]

{ #category : #displaying }
CmSpecCommand >> displayIn: aMenuGroupOrPresenter do: aBlock [
	self displayStrategy display: self in: aMenuGroupOrPresenter do: aBlock
]

{ #category : #accessing }
CmSpecCommand >> displayStrategy [
	^ displayStrategy
]

{ #category : #accessing }
CmSpecCommand >> displayStrategy: anObject [
	displayStrategy := anObject
]

{ #category : #hooks }
CmSpecCommand >> execute [
	[ super execute ]
		on: InteractionError
		do: [ :notificationOrError | notificationOrError actForSpec ]
]

{ #category : #testing }
CmSpecCommand >> hasIcon [

	^ self iconName isNotNil
]

{ #category : #testing }
CmSpecCommand >> hasShortcutKey [

	^ shortcutKey isNotNil
]

{ #category : #accessing }
CmSpecCommand >> icon [
	self iconName ifNil: [ ^ nil ].
	
	^ self iconNamed: self iconName
]

{ #category : #accessing }
CmSpecCommand >> iconName [
	^ iconName
]

{ #category : #accessing }
CmSpecCommand >> iconName: aSymbol [ 
	iconName := aSymbol
]

{ #category : #configuring }
CmSpecCommand >> iconName: aString from: anIconProvider [ 
	self iconProvider: anIconProvider.
	self iconName: aString.
]

{ #category : #accessing }
CmSpecCommand >> iconNamed: aSymbol [
	^ self iconProvider iconNamed: aSymbol
]

{ #category : #accessing }
CmSpecCommand >> iconProvider [
	^ iconProvider ifNil: [ iconProvider := Smalltalk ui icons ]
]

{ #category : #accessing }
CmSpecCommand >> iconProvider: anObject [
	iconProvider := anObject
]

{ #category : #initialization }
CmSpecCommand >> initialize [ 

	super initialize.
	self beDisabledWhenCantBeRun
]

{ #category : #accessing }
CmSpecCommand >> shortcutKey [
	^ shortcutKey ifNil: [ CmNoShortcutIsDefined signalCommand: self ]
]

{ #category : #accessing }
CmSpecCommand >> shortcutKey: aString [
 	shortcutKey := aString 
]
