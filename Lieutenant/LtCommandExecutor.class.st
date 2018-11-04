"
I'm responsible for providing information to command and executing commands.

!! Providing Information

I give to the command the possibility to configure itself using information from the tool that uses it. 

	LtCommandExecutor >> prepareNewCommand: aCommand from: aTool
	
!! Executing Command

I define three steps to execute a command:

1) #prepareCommandForExecution. 
For its execution, a command may retrieve required state from the tool that invoke it. 

	LtCommandExecutor >> prepareCommandForExecution
	

During preparation commands can break execution by signalling LtCommandAborted. For example it happens when the user cancels some confirmation dialog during command preparation.

2) Command execution. 
	All logic is implemented by command itself (#execute method).
	command execute.
	
3) Applying execution results to activation context. 
It is also delegated to the command itself though context instance:

	LtCommandExecutor >> applyCommandResult
	
			  
The idea is to be able to interact with the application when a command terminates. 
For example if the user creates new package from browser then at the end the browser should open the newly created package.

"
Class {
	#name : #LtCommandExecutor,
	#superclass : #Object,
	#instVars : [
		'command',
		'invokingTool'
	],
	#category : #Lieutenant
}

{ #category : #'instance creation' }
LtCommandExecutor class >> createCommand: aCommand toBeExecutedFor: aTool [
	| command |
	command := aCommand new.
	self prepareNewCommand: command from: aTool.
	^command
]

{ #category : #error }
LtCommandExecutor >> abortExceptionClass [

	^ LtCommandAborted
]

{ #category : #execution }
LtCommandExecutor >> applyCommandResult [
	"Final step of command execution, the impact on invoker tool."
	
	command applyResultIn: invokingTool 
]

{ #category : #execution }
LtCommandExecutor >> basicExecuteCommand [
	
	command execute
]

{ #category : #execution }
LtCommandExecutor >> executeCommand [
	"Command execution is structured around 3 main steps: 1 adaptation to most recent tool context, 2 execution, and 3 command effects on the system."
	
	[ self prepareCommandForExecution.
	self basicExecuteCommand. 
	self applyCommandResult ] 
		on: self abortExceptionClass do: [ :exc | "to me it looks like a bad idea to have this empty handler" ]
]

{ #category : #execution }
LtCommandExecutor >> prepareCommandForExecution [
	"Before its execution a command may need to do special action."
	
	command prepareForExecutionIn: invokingTool 
]

{ #category : #initialization }
LtCommandExecutor >> prepareNewCommand: aCommand from: aTool [

	command := aCommand. 
	invokingTool := aTool. 
	command configureYourselfFrom: invokingTool 
]
