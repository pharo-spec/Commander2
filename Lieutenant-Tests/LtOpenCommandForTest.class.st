Class {
	#name : #LtOpenCommandForTest,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Tests'
}

{ #category : #default }
LtOpenCommandForTest class >> defaultCommandName [ 

	^ 'Open'
]

{ #category : #default }
LtOpenCommandForTest class >> defaultDescription [
	^ 'I open something'
]

{ #category : #default }
LtOpenCommandForTest class >> defaultIconName [

	^ #error
]

{ #category : #default }
LtOpenCommandForTest class >> defaultShortcutKey [
 	^ 'O'
]
