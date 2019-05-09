Class {
	#name : #LtCommand,
	#superclass : #LtAbstractCommand,
	#traits : 'LtTWithBasicNameAndDescription + LtTDecorable',
	#classTraits : 'LtTWithBasicNameAndDescription classTrait + LtTDecorable classTrait',
	#instVars : [
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
	^ 'I''m command and I should provide a nice description for my user.'
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
LtCommand >> canBeRun [
	"See my super class comment for this method.
	 By default I return true.
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

{ #category : #testing }
LtCommand >> hasContext [
	^ self context isNotNil
]

{ #category : #initialization }
LtCommand >> initialize [
	super initialize.
	self basicName: self class defaultCommandName.
	self basicDescription: self class defaultDescription
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
