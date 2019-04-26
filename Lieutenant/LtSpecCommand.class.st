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
		'shortcutKey'
	],
	#category : #Lieutenant
}

{ #category : #default }
LtSpecCommand class >> defaultIconName [
	"nil is not really nice but it indicates that by default the command does not have an icon."

	^ #blank
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
	self iconName: self class defaultIconName
]

{ #category : #accessing }
LtSpecCommand >> shortcutKey [
	^ shortcutKey ifNil: [ LtNoShortcutIsDefined signalCommand: self ]
]

{ #category : #accessing }
LtSpecCommand >> shortcutKey: aString [
 	shortcutKey := aString 
]
