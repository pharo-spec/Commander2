Class {
	#name : #LtBrowse,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Example'
}

{ #category : #default }
LtBrowse class >> defaultCommandName [ 

	^ 'Browse'
]

{ #category : #default }
LtBrowse class >> defaultDescription [

	^ 'I am a command that can be used either on a class, a method or a trait to browse it.'
]

{ #category : #hooks }
LtBrowse >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant.
	"
	self context browse
]
