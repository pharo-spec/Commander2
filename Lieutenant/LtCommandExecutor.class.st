"
I'm responsible for providing information and executing commands.

!! Providing Information

I give to the command the possibility to configure itself using information from the tool that uses it. 
	LtCommandExecutor >> prepareNewCommand: aCommand
		aCommand configureYourselfFrom: self
		

!! Executing Command

I define three steps to execute a command:

1) #prepareCommandForExecution. 
For its execution, a command should retrieve all required state from activation context. 
By default this logic is delegated to the command through context instance:

	LtCommandExecutor >> prepareCommandForExecution
		actualActivationContext prepareExecutionOf: command  

During preparation commands can break execution by signalling LtCommandAborted. For example it happens when the user cancels some confirmation dialog during command preparation.

2) Command execution. 
	All logic is implemented by command itself (#execute method).
	command execute.
	
3) Applying execution results to activation context. 
It is also delegated to the command itself though context instance:

	CmdCommandActivator >> applyCommandResult
		actualActivationContext applyResultOf: command
		
		  
The idea is to be able to interact with the application when a command completes. 
For example if the user creates new package from browser then at the end the browser should open the created package.

"
Class {
	#name : #LtCommandExecutor,
	#superclass : #Object,
	#instVars : [
		'actualActivationContext',
		'command'
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

{ #category : #execution }
LtCommandExecutor >> abortExceptionClass [

	^ LtCommandAborted
]

{ #category : #execution }
LtCommandExecutor >> basicExecuteCommand [
	
	command execute
]

{ #category : #execution }
LtCommandExecutor >> executeCommand [
	"Command execution is structured around 3 main steps: 1 adaptation to most recent tool context, 2 execution, and 3 command effects on the system."
	[self prepareCommandForExecution.
	self basicExecuteCommand. 
	self applyCommandResult] 
		on: self abortExceptionClass do: [ :exc | "to me it looks like a bad idea to have this empty handler" ]
]

{ #category : #execution }
LtCommandExecutor >> prepareCommandForExecution [
	"Before its execution a command may need to do special action."
	
	command prepareForExecutionIn: actualActivationContext 
]

{ #category : #initialization }
LtCommandExecutor >> prepareNewCommand: aCommand from: aTool [

	command := aCommand. 
	actualActivationContext := aTool. 
	command configureYourselfFrom: actualActivationContext 
]
