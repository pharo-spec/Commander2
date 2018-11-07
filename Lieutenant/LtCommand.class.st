"
Contrary to Commander, a command can be customised at the moment of use.
Hence even though the class describing a command define an iconName/name/shortcut, when creating the command such information can be overloaded. 

A command may have an icon or not (message noIcon/useIcon)
Then when it has an icon it can be defined statically as a class method, or customized on the spot.

[[[
LtOpenCommandForTest new
]]]
   
[[[
LtOpenCommandForTest new			
	name: 'on the fly';
   shortkey: 'A'
]]]

Questions: 

- May be this logic can be simplified. For now make it works.
- Why canBeExecutedInContext: aToolContext is a class method?
"
Class {
	#name : #LtCommand,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'hasIcon',
		'iconName',
		'shortcutKey'
	],
	#category : #Lieutenant
}

{ #category : #default }
LtCommand class >> defaultCommandName [ 

	^ 'Unnamed'
]

{ #category : #default }
LtCommand class >> defaultDescription [
	^ 'I''m a little command and I should provide a nice description for my user.'
]

{ #category : #default }
LtCommand class >> defaultIconName [
	"nil is not really nice but it indicates that by default the command does not have an icon."

	^ nil
]

{ #category : #accessing }
LtCommand class >> defaultShortcutKey [
 	^ 'O'
]

{ #category : #testing }
LtCommand >> canBeExecutedIn: anObject [
	"Specify whether the command can be executed. Usually a presenter will invoke this method with itself or an object representing a selection context"
	
	^ true
]

{ #category : #accessing }
LtCommand >> description [

	^ description ifNil: [ description := self class defaultDescription ]
]

{ #category : #accessing }
LtCommand >> description: aString [

	description := aString 
]

{ #category : #icons }
LtCommand >> ensureIcon [
	"Force to return an icon. By default when there is no icon returns an error."
	
	^self iconName ifNil: [ self iconNamed: #error ]
]

{ #category : #testing }
LtCommand >> hasIcon [
	"Returns true when the command defines an icon name. Not all the commands are required to have icon."
	
	^ hasIcon
]

{ #category : #icons }
LtCommand >> icon [
	"Precondition: do not call icon on receiver not having an icon."
	"It may be better to have iconNamed:ifNone: in addition to iconNamed: in superclass."
	^ self iconNamed: self iconName
]

{ #category : #accessing }
LtCommand >> iconName [
	"Return the name of an icon, when the command is supposed to have one, nil otherwise"
	
	^ hasIcon 
		ifFalse: [ nil "we could also raise an error but we should check the impact" ]
		ifTrue: [ iconName isNil 
						ifTrue: [ iconName := self class defaultIconName ].
					iconName ]
	
]

{ #category : #accessing }
LtCommand >> iconName: aSymbol [ 
	iconName := aSymbol
]

{ #category : #initialization }
LtCommand >> initialize [ 
	
	hasIcon := true
]

{ #category : #accessing }
LtCommand >> name [
	^name ifNil: [ name := self class defaultCommandName ]
]

{ #category : #accessing }
LtCommand >> name: aString [

	name := aString
]

{ #category : #icons }
LtCommand >> noIcon [
	hasIcon := false
]

{ #category : #accessing }
LtCommand >> shortcutKey [
	"it is probably bad and we should store something else"
	
	^ shortcutKey ifNil: [ shortcutKey := self class defaultShortcutKey ]
]

{ #category : #accessing }
LtCommand >> shortcutKey: aString [
 	shortcutKey := aString 
]

{ #category : #icons }
LtCommand >> useIcon [
	hasIcon := true
]
