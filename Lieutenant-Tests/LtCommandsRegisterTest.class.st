"
A LtCommandsRegistryTest is a test class for testing the behavior of LtCommandsRegistry
"
Class {
	#name : #LtCommandsRegisterTest,
	#superclass : #TestCase,
	#instVars : [
		'firstCommand',
		'subCommand1',
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
							basicName: 'first command';
							block: [ :x | x ];
							context: [ 1 ];
							yourself.
	
	
	subCommand1 :=  LtBlockCommand new
							basicName: 'sub command 1';
							block: [ :x | x ];
							context: [ 11 ];
							yourself.
	
	subRegister1 := (LtCommandsRegister named: 'sub register 1')
							register: subCommand1;
							yourself.
	
	subRegister2 := LtCommandsRegister named: 'sub register 2'. "Empty on purpose."
	
	register
		register: firstCommand;
		register: subRegister1;
		register: subRegister2
]

{ #category : #test }
LtCommandsRegisterTest >> testAllCommands [
	self assertCollection: register allCommands equals: { firstCommand . subCommand1 } asOrderedCollection
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
LtCommandsRegisterTest >> testEntries [
	self assert: (register entries allSatisfy: [ :e | (e isKindOf: LtAbstractCommand) or: [ e isKindOf: LtCommandsRegister ] ]).
	self assertCollection: (register entries) equals: { firstCommand . subRegister1 . subRegister2 } asOrderedCollection
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
LtCommandsRegisterTest >> testInitialize [
	| newRegister |
	newRegister := LtCommandsRegister new.
	
	self assert: newRegister basicName equals: LtCommandsRegister defaultName.
	self assert: newRegister entries isEmpty
]

{ #category : #test }
LtCommandsRegisterTest >> testRegisterCommandWithContext [
	| secondCommand |
	self deny: (register hasEntryNamed: 'second command').
	
	secondCommand := LtBlockCommand new 
							basicName: 'second command';
							block: [ :x | x ];
							context: 42;
							yourself.
	register register: secondCommand.
	
	self assert: (register hasEntryNamed: 'second command').
	self assert: (register commandOrRegisterNamed: 'second command') equals: secondCommand.
	self assert: register entries last context equals: 42
]

{ #category : #test }
LtCommandsRegisterTest >> testRegisterCommandWithContextBlock [
	| secondCommand secondCommandWithSameName |
	self deny: (register hasEntryNamed: 'second command').
	
	secondCommand := LtBlockCommand new 
							basicName: 'second command';
							block: [ :x | x ];
							context: [ 42 ];
							yourself.
	register register: secondCommand.
	
	self assert: (register hasEntryNamed: 'second command').
	self assert: (register commandOrRegisterNamed: 'second command') equals: secondCommand.
	
	secondCommandWithSameName := LtBlockCommand new 
											basicName: 'second command';
											block: [ :x | x ];
											context: [ ];
											yourself.
	
	self
		should: [ register register: secondCommandWithSameName]
		raise: LtDuplicatedEntryName
		withExceptionDo: [ :error |
			self assert: error entryName equals: 'second command' ]
]

{ #category : #test }
LtCommandsRegisterTest >> testRegisterSubRegister [
	| subRegister3 |
	self deny: (register hasEntryNamed: 'sub register 3').
	
	subRegister3 := LtCommandsRegister named: 'sub register 3'.
	register register: subRegister3.
	
	self assert: (register hasEntryNamed: 'sub register 3').
	self assert: (register commandOrRegisterNamed: 'sub register 3') equals: subRegister3.
	
	self
		should: [ register register: (LtCommandsRegister named: 'sub register 3') ]
		raise: LtDuplicatedEntryName
		withExceptionDo: [ :error |
			self assert: error entryName equals: 'sub register 3' ]
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
