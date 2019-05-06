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
	#superclass : #LtAbstractCommand,
	#instVars : [
		'name',
		'description',
		'context'
	],
	#category : #'Lieutenant-Commands'
}

{ #category : #default }
LtCommand class >> defaultCommandName [ 

	^ 'Unnamed'
]

{ #category : #default }
LtCommand class >> defaultDescription [
	^ 'I''m a little command and I should provide a nice description for my user.'
]

{ #category : #'instance creation' }
LtCommand class >> forSpec [
	^ self new
		asSpecCommand
]

{ #category : #'instance creation' }
LtCommand class >> forSpecWithIconNamed: aSymbol [
	^ self new asSpecCommandWithIconNamed: aSymbol
]

{ #category : #'instance creation' }
LtCommand class >> forSpecWithIconNamed: aSymbol shortcutKey: aKMKeyCombination [
	^ self new
		asSpecCommandWithIconNamed: aSymbol shortcutKey: aKMKeyCombination
]

{ #category : #running }
LtCommand class >> runWith: anObject [
	self new runWith: anObject
]

{ #category : #hooks }
LtCommand >> canBeRunOn: anObject [
	"This hook allows the command decide if it can be run on anObject or not.
	 It should return a boolean. By default, returns true.
	"
	^ true
]

{ #category : #accessing }
LtCommand >> context [
	^ context
]

{ #category : #accessing }
LtCommand >> context: anObject [
	context := anObject
]

{ #category : #accessing }
LtCommand >> description [

	^ description ifNil: [ description := self class defaultDescription ]
]

{ #category : #accessing }
LtCommand >> description: aString [

	description := aString 
]

{ #category : #testing }
LtCommand >> hasContext [
	^ self context isNotNil
]

{ #category : #accessing }
LtCommand >> name [
	^ name ifNil: [ name := self class defaultCommandName ]
]

{ #category : #accessing }
LtCommand >> name: aString [

	name := aString
]

{ #category : #'public-api' }
LtCommand >> run [
	self runWith: self context
]

{ #category : #'public-api' }
LtCommand >> runWith: anObject [
	self context: anObject.
	self execute
]
