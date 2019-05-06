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
		'description',
		'basicName',
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

{ #category : #accessing }
LtCommand >> basicName [
	^ basicName
]

{ #category : #accessing }
LtCommand >> basicName: aString [

	basicName := aString
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
	"The #context might be a BlockClosure that computes the actual context object when needed.
	 Thus, we send #value which in case of a BlockClosure evaluate it and in case of another
	 Object, simply returns itself.
	"
	^ context value
]

{ #category : #accessing }
LtCommand >> context: anObject [
	context := anObject
]

{ #category : #accessing }
LtCommand >> description [

	^ description
]

{ #category : #accessing }
LtCommand >> description: aString [

	description := aString 
]

{ #category : #testing }
LtCommand >> hasContext [
	^ self context isNotNil
]

{ #category : #initialization }
LtCommand >> initialize [
	super initialize.
	self basicName: self class defaultCommandName.
	self description: self class defaultDescription
]

{ #category : #hooks }
LtCommand >> name [
	"This hook is called to generate a name that depends on the context.
	 When entering this method, one can expect that the context can be accessed
	 through a call to #context method.
	 By default, my #basicName is returned.
	"
	^ self basicName
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
