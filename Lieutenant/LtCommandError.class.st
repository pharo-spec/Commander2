"
I am an abstract error that can be thrown by a command.

I hold the command that generated myself in my #command inst. var.

One can create an instance of myself like this:
[[[
LtCommandError command: LtCommand new
]]]

One can create an instance of myself and directly signal it like this:
[[[
LtCommandError signalCommand: LtCommand new
]]]
"
Class {
	#name : #LtCommandError,
	#superclass : #Error,
	#instVars : [
		'command'
	],
	#category : #Lieutenant
}

{ #category : #'instance creation' }
LtCommandError class >> command: aLtSpecCommand [ 
	^ self new
		command: aLtSpecCommand;
		yourself
]

{ #category : #signalling }
LtCommandError class >> signalCommand: aLtSpecCommand [ 
	(self command: aLtSpecCommand) signal
]

{ #category : #accessing }
LtCommandError >> command [
	^ command
]

{ #category : #accessing }
LtCommandError >> command: aLtSpecCommand [ 
	command := aLtSpecCommand 
]
