Class {
	#name : #LtBrowseFull,
	#superclass : #LtCommand,
	#instVars : [
		'class'
	],
	#category : #'Lieutenant-Example'
}

{ #category : #default }
LtBrowseFull class >> defaultCommandName [ 

	^ 'Browse full'
]

{ #category : #default }
LtBrowseFull class >> defaultDescription [

	^ 'I am a command that can be used either on a class or a method.
In case of a class, I just browse it.
In case of a method, I browse its class.'
]

{ #category : #hooks }
LtBrowseFull >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	class browse
]

{ #category : #hooks }
LtBrowseFull >> extractInformationFromContext: aBehaviourOrCompiledMethod [
	class := aBehaviourOrCompiledMethod isCompiledMethod
					ifTrue: [ aBehaviourOrCompiledMethod methodClass ]
					ifFalse: [ aBehaviourOrCompiledMethod ]
]
