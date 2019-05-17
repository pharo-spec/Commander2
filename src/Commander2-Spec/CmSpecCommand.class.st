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
		'iconName',
		'shortcutKey',
		'displayStrategy'
	],
	#category : #'Commander2-Spec-Core'
}

{ #category : #default }
CmSpecCommand class >> defaultIconName [
	^ #blank
]

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
CmSpecCommand >> hasShortcut [
	^ shortcutKey isNotNil
]

{ #category : #icons }
CmSpecCommand >> icon [
	"Precondition: do not call icon on receiver not having an icon."
	"It may be better to have iconNamed:ifNone: in addition to iconNamed: in superclass."
	^ self iconNamed: self iconName
]

{ #category : #accessing }
CmSpecCommand >> iconName [
	"Return the name of an icon."
	^ iconName
	
]

{ #category : #accessing }
CmSpecCommand >> iconName: aSymbol [ 
	iconName := aSymbol
]

{ #category : #initialization }
CmSpecCommand >> initialize [ 
	super initialize.
	self iconName: self class defaultIconName.
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
