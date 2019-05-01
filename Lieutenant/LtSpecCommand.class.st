"
I am a command decorator adding informations useful when for usage in context of a Spec application.

Basically, I add:
- an #icon (#blank by default)
- a #shortcutKey (optional)
"
Class {
	#name : #LtSpecCommand,
	#superclass : #LtCommandDecorator,
	#instVars : [
		'iconName',
		'shortcutKey',
		'alwaysVisible',
		'weight'
	],
	#category : #'Lieutenant-Commands'
}

{ #category : #default }
LtSpecCommand class >> defaultIconName [
	"nil is not really nice but it indicates that by default the command does not have an icon."

	^ #blank
]

{ #category : #accessing }
LtSpecCommand >> alwaysVisible [
	"If #alwaysVisible is true, the command will always be visible in the UI.
	 In this case, when #canBeRunOn: returns false it will be shown in disabled mode.
	
	 If #alwaysVisible is false, the command will not be visible in the ui when canBeRunOn: returns false.
	"
	^ alwaysVisible
]

{ #category : #accessing }
LtSpecCommand >> alwaysVisible: anObject [
	alwaysVisible := anObject
]

{ #category : #testing }
LtSpecCommand >> hasShortcut [
	^ shortcutKey isNotNil
]

{ #category : #icons }
LtSpecCommand >> icon [
	"Precondition: do not call icon on receiver not having an icon."
	"It may be better to have iconNamed:ifNone: in addition to iconNamed: in superclass."
	^ self iconNamed: self iconName
]

{ #category : #accessing }
LtSpecCommand >> iconName [
	"Return the name of an icon."
	^ iconName
	
]

{ #category : #accessing }
LtSpecCommand >> iconName: aSymbol [ 
	iconName := aSymbol
]

{ #category : #initialization }
LtSpecCommand >> initialize [ 
	super initialize.
	self iconName: self class defaultIconName.
	self alwaysVisible: true.
	self weight: 10
]

{ #category : #accessing }
LtSpecCommand >> shortcutKey [
	^ shortcutKey ifNil: [ LtNoShortcutIsDefined signalCommand: self ]
]

{ #category : #accessing }
LtSpecCommand >> shortcutKey: aString [
 	shortcutKey := aString 
]

{ #category : #accessing }
LtSpecCommand >> weight [
	"Returns the weight of the command (for displaying it in the menu).
	 The less weight, the higher in the menu.
	 Of course, this method should return a Number.
	"
	^ weight
]

{ #category : #accessing }
LtSpecCommand >> weight: anObject [
	weight := anObject
]
