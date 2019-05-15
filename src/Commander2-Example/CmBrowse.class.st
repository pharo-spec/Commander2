Class {
	#name : #CmBrowse,
	#superclass : #CmCommand,
	#category : #'Commander2-Example'
}

{ #category : #default }
CmBrowse class >> defaultCommandName [ 

	^ 'Browse'
]

{ #category : #default }
CmBrowse class >> defaultDescription [

	^ 'I am a command that can be used either on a class, a method or a trait to browse it.'
]

{ #category : #hooks }
CmBrowse >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant.
	"
	self context browse
]
