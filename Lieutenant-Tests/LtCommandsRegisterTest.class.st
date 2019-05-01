"
A LtCommandsRegistryTest is a test class for testing the behavior of LtCommandsRegistry
"
Class {
	#name : #LtCommandsRegisterTest,
	#superclass : #TestCase,
	#instVars : [
		'firstCommand',
		'firstCommandContextBlock',
		'subCommand1',
		'subCommand1ContextBlock',
		'subRegister1',
		'subRegister2',
		'register'
	],
	#category : #'Lieutenant-Tests'
}

{ #category : #running }
LtCommandsRegisterTest >> setUp [
	super setUp.
	register := LtCommandsRegister named: 'main register'.
	firstCommand := LtBlockCommand new
							name: 'first command';
							block: [ :x | x ];
							yourself.
	firstCommandContextBlock := [ 1 ].
	
	
	subCommand1 :=  LtBlockCommand new
							name: 'sub command 1';
							block: [ :x | x ];
							yourself.
	subCommand1ContextBlock := [ 11 ].
	
	subRegister1 := (LtCommandsRegister named: 'sub register 1')
							registerCommand: subCommand1 withContextBlock: subCommand1ContextBlock;
							yourself.
	
	subRegister2 := LtCommandsRegister named: 'sub register 2'. "Empty on purpose."
	
	register
		registerCommand: firstCommand withContextBlock: firstCommandContextBlock;
		registerSubRegister: subRegister1;
		registerSubRegister: subRegister2
]

{ #category : #test }
LtCommandsRegisterTest >> testAllCommands [
	"| command |
	self assert: register allCommands isEmpty.
	command := LtSimpleRenameContactCommand new.
	register registerCommand: command underCategory: #tests withContextBlock: [ { Contact new . 'John' } ].
	
	self assert: register allCommands size equals: 1.
	self assert: register allCommands anyOne equals: command"
	self fail
]

{ #category : #test }
LtCommandsRegisterTest >> testCommandOrRegisterNamed [
	self assert: (register commandOrRegisterNamed: 'first command') equals: firstCommand.
	self assert: (register commandOrRegisterNamed: 'sub register 1') equals: subRegister1.
	self assert: (register commandOrRegisterNamed: 'sub register 2') equals: subRegister2.	
	
	self should: [ register commandOrRegisterNamed: 'unknown' ] raise: NotFound.
	
	self assert: ((register commandOrRegisterNamed: 'sub register 1') commandOrRegisterNamed: 'sub command 1') equals: subCommand1.
]

{ #category : #test }
LtCommandsRegisterTest >> testCommands [
	self assertCollection: register commands equals: { firstCommand } asOrderedCollection
]

{ #category : #test }
LtCommandsRegisterTest >> testHasCommand [
	self deny: (register hasCommand: LtCommand new).
	
	self assert: (register hasCommand: firstCommand)
]

{ #category : #test }
LtCommandsRegisterTest >> testHasEntryNamed [
	self deny: (register hasEntryNamed: 'nope').
	
	self assert: (register hasEntryNamed: 'first command').
	
	self deny: (register hasEntryNamed: 'sub command 1').
]

{ #category : #test }
LtCommandsRegisterTest >> testRegisterCommandWithContextBlock [
	| secondCommand |
	self deny: (register hasEntryNamed: 'second command').
	
	secondCommand := LtBlockCommand new 
							name: 'second command';
							block: [ :x | x ];
							yourself.
	register registerSubRegister: secondCommand.
	
	self assert: (register hasEntryNamed: 'second command').
	self assert: (register commandOrRegisterNamed: 'second command') equals: secondCommand
]

{ #category : #test }
LtCommandsRegisterTest >> testRegisterSubRegister [
	| subRegister3 |
	self deny: (register hasEntryNamed: 'sub register 3').
	
	subRegister3 := LtCommandsRegister named: 'sub register 3'.
	register registerSubRegister: subRegister3.
	
	self assert: (register hasEntryNamed: 'sub register 3').
	self assert: (register commandOrRegisterNamed: 'sub register 3') equals: subRegister3
]

{ #category : #test }
LtCommandsRegisterTest >> testRegistry [
	self assertCollection: register registry equals: { subRegister1. subRegister2 } asOrderedCollection
]

{ #category : #test }
LtCommandsRegisterTest >> testUnregister [
	self assert: (register hasEntryNamed: 'first command').
	register unregister: firstCommand.
	self deny: (register hasEntryNamed: 'first command').
	
	self assert: (register hasEntryNamed: 'sub register 1').
	register unregister: subRegister1.
	self deny: (register hasEntryNamed: 'sub register 1').
]
