Class {
	#name : #LtCommand,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'iconName',
		'shortcutKey'
	],
	#category : #Lieutenant
}

{ #category : #default }
LtCommand >> defaultCommandName [ 

	^ 'Unnamed'
]

{ #category : #default }
LtCommand >> defaultDescription [
	^ 'I''m a little command and I should provide a nice description for my user.'
]

{ #category : #default }
LtCommand >> defaultIconName [
	"nil is not really nice but it indicates that by default the command does not have an icon."

	^ nil
]

{ #category : #accessing }
LtCommand >> defaultShortcutKey [
 	^ 'O'
]

{ #category : #accessing }
LtCommand >> description [

	^ description ifNil: [ description := self defaultDescription ]
]

{ #category : #accessing }
LtCommand >> description: aString [

	description := aString 
]

{ #category : #execution }
LtCommand >> execute [
	"by default do nothing"
]

{ #category : #testing }
LtCommand >> hasIcon [
	"Returns true when there is an icon name. Not all the command are required to have icon."
	
	^ (iconName = #noIconName) not
]

{ #category : #accessing }
LtCommand >> iconName [
	^ iconName hasIcon ifTrue: [ iconName := self defaultIconName ]
]

{ #category : #accessing }
LtCommand >> iconName: aSymbol [ 
	iconName := aSymbol
]

{ #category : #accessing }
LtCommand >> name [
	^name ifNil: [ name := self defaultCommandName ]
]

{ #category : #accessing }
LtCommand >> name: aString [

	name := aString
]

{ #category : #accessing }
LtCommand >> shortcutKey [
	"it is probably bad and we should store something else"
	
	^ shortcutKey ifNil: [ shortcutKey := self defaultShortCutKey ]
]

{ #category : #accessing }
LtCommand >> shortcutKey: aString [
 	shortcutKey := aString 
]
