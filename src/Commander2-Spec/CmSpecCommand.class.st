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
		'displayStrategy',
		'icon'
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

	^ icon isNotNil
]

{ #category : #testing }
CmSpecCommand >> hasShortcutKey [

	^ shortcutKey isNotNil
]

{ #category : #icons }
CmSpecCommand >> icon [
	"Precondition: do not call icon on receiver not having an icon."

	^ icon
]

{ #category : #icons }
CmSpecCommand >> icon: anIcon [
	
	icon := anIcon
]

{ #category : #accessing }
CmSpecCommand >> iconName: aSymbol [ 

	self icon: (self iconNamed: aSymbol)
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
