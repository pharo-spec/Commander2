Class {
	#name : #LtOpenCommand,
	#superclass : #LtCommand,
	#category : #Lieutenant
}

{ #category : #default }
LtOpenCommand >> defaultCommandName [ 

	^ 'Open'
]

{ #category : #default }
LtOpenCommand >> defaultDescription [
	^ 'I open something'
]

{ #category : #default }
LtOpenCommand >> defaultIconName [

	^ #error
]

{ #category : #default }
LtOpenCommand >> defaultShortcutKey [
 	^ 'O'
]
