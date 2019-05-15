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
		'alwaysVisible'
	],
	#category : #'Lieutenant-Spec'
}

{ #category : #default }
CmSpecCommand class >> defaultIconName [
	^ #blank
]

{ #category : #accessing }
CmSpecCommand >> alwaysVisible [
	"If #alwaysVisible is true, the command will always be visible in the UI.
	 In this case, when #canBeRunOn: returns false it will be shown in disabled mode.
	
	 If #alwaysVisible is false, the command will not be visible in the ui when canBeRunOn: returns false.
	"
	^ alwaysVisible
]

{ #category : #accessing }
CmSpecCommand >> alwaysVisible: anObject [
	alwaysVisible := anObject
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
	self alwaysVisible: true
]

{ #category : #accessing }
CmSpecCommand >> shortcutKey [
	^ shortcutKey ifNil: [ CmNoShortcutIsDefined signalCommand: self ]
]

{ #category : #accessing }
CmSpecCommand >> shortcutKey: aString [
 	shortcutKey := aString 
]
