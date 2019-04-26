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
		'description'
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

{ #category : #decorating }
LtCommand >> asSpecCommand [
	^ self decorateWith: LtSpecCommand
]

{ #category : #decorating }
LtCommand >> asSpecCommandWithIconNamed: aSymbol [
	^ self asSpecCommandWithIconNamed: aSymbol shortcutKey: nil
]

{ #category : #decorating }
LtCommand >> asSpecCommandWithIconNamed: aSymbol shortcutKey: aKMKeyCombination [
	^ (self decorateWith: LtSpecCommand)
		iconName: aSymbol;
		shortcutKey: aKMKeyCombination
]

{ #category : #testing }
LtCommand >> canBeExecutedIn: anObject [
	"Specify whether the command can be executed. Usually a presenter will invoke this method with itself or an object representing a selection context"
	
	^ true
]

{ #category : #decorating }
LtCommand >> decorateWith: aLtCommandDecoratorClass [
	^ aLtCommandDecoratorClass decorate: self
]

{ #category : #accessing }
LtCommand >> description [

	^ description ifNil: [ description := self class defaultDescription ]
]

{ #category : #accessing }
LtCommand >> description: aString [

	description := aString 
]

{ #category : #execute }
LtCommand >> execute [
	"Execute the command."
	self subclassResponsibility
]

{ #category : #accessing }
LtCommand >> name [
	^name ifNil: [ name := self class defaultCommandName ]
]

{ #category : #accessing }
LtCommand >> name: aString [

	name := aString
]
