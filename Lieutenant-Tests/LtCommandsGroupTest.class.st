"
A LtCommandsRegistryTest is a test class for testing the behavior of LtCommandsRegistry
"
Class {
	#name : #LtCommandsGroupTest,
	#superclass : #TestCase,
	#instVars : [
		'firstCommand',
		'subCommand1',
		'group',
		'subGroup1',
		'subGroup2'
	],
	#category : #'Lieutenant-Tests'
}

{ #category : #running }
LtCommandsGroupTest >> setUp [
	super setUp.
	group := LtCommandsGroup named: 'main group'.
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
	
	subGroup1 := (LtCommandsGroup named: 'sub group 1')
							register: subCommand1;
							yourself.
	
	subGroup2 := LtCommandsGroup named: 'sub group 2'. "Empty on purpose."
	
	group
		register: firstCommand;
		register: subGroup1;
		register: subGroup2
]

{ #category : #test }
LtCommandsGroupTest >> testAllCommands [
	self assertCollection: group allCommands equals: { firstCommand . subCommand1 } asOrderedCollection
]

{ #category : #test }
LtCommandsGroupTest >> testCommandOrGroupNamed [
	self assert: (group commandOrGroupNamed: 'first command') equals: firstCommand.
	self assert: (group commandOrGroupNamed: 'sub group 1') equals: subGroup1.
	self assert: (group commandOrGroupNamed: 'sub group 2') equals: subGroup2.	
	
	self should: [ group commandOrGroupNamed: 'unknown' ] raise: NotFound.
	
	self assert: ((group commandOrGroupNamed: 'sub group 1') commandOrGroupNamed: 'sub command 1') equals: subCommand1.
]

{ #category : #test }
LtCommandsGroupTest >> testCommands [
	self assertCollection: group commands equals: { firstCommand } asOrderedCollection
]

{ #category : #test }
LtCommandsGroupTest >> testEntries [
	self assert: (group entries allSatisfy: [ :e | e isCommand or: [ e isGroup ] ]).
	self assertCollection: (group entries) equals: { firstCommand . subGroup1 . subGroup2 } asOrderedCollection
]

{ #category : #test }
LtCommandsGroupTest >> testGroups [
	self assertCollection: group groups equals: { subGroup1. subGroup2 } asOrderedCollection
]

{ #category : #test }
LtCommandsGroupTest >> testHasCommand [
	self deny: (group hasCommand: LtCommand new).
	
	self assert: (group hasCommand: firstCommand)
]

{ #category : #test }
LtCommandsGroupTest >> testHasEntryNamed [
	self deny: (group hasEntryNamed: 'nope').
	
	self assert: (group hasEntryNamed: 'first command').
	
	self deny: (group hasEntryNamed: 'sub command 1').
]

{ #category : #test }
LtCommandsGroupTest >> testInitialize [
	| newGroup |
	newGroup := LtCommandsGroup new.
	
	self assert: newGroup basicName equals: LtCommandsGroup defaultName.
	self assert: newGroup entries isEmpty
]

{ #category : #test }
LtCommandsGroupTest >> testRegisterCommandWithContext [
	| secondCommand |
	self deny: (group hasEntryNamed: 'second command').
	
	secondCommand := LtBlockCommand new 
							basicName: 'second command';
							block: [ :x | x ];
							context: 42;
							yourself.
	group register: secondCommand.
	
	self assert: (group hasEntryNamed: 'second command').
	self assert: (group commandOrGroupNamed: 'second command') equals: secondCommand.
	self assert: group entries last context equals: 42
]

{ #category : #test }
LtCommandsGroupTest >> testRegisterCommandWithContextBlock [
	| secondCommand secondCommandWithSameName |
	self deny: (group hasEntryNamed: 'second command').
	
	secondCommand := LtBlockCommand new 
							basicName: 'second command';
							block: [ :x | x ];
							context: [ 42 ];
							yourself.
	group register: secondCommand.
	
	self assert: (group hasEntryNamed: 'second command').
	self assert: (group commandOrGroupNamed: 'second command') equals: secondCommand.
	
	secondCommandWithSameName := LtBlockCommand new 
											basicName: 'second command';
											block: [ :x | x ];
											context: [ ];
											yourself.
	
	self
		should: [ group register: secondCommandWithSameName]
		raise: LtDuplicatedEntryName
		withExceptionDo: [ :error |
			self assert: error entryName equals: 'second command' ]
]

{ #category : #test }
LtCommandsGroupTest >> testRegisterSubRegister [
	| subGroup3 |
	self deny: (group hasEntryNamed: 'sub group 3').
	
	subGroup3 := LtCommandsGroup named: 'sub group 3'.
	group register: subGroup3.
	
	self assert: (group hasEntryNamed: 'sub group 3').
	self assert: (group commandOrGroupNamed: 'sub group 3') equals: subGroup3.
	
	self
		should: [ group register: (LtCommandsGroup named: 'sub group 3') ]
		raise: LtDuplicatedEntryName
		withExceptionDo: [ :error |
			self assert: error entryName equals: 'sub group 3' ]
]

{ #category : #test }
LtCommandsGroupTest >> testUnregister [
	self assert: (group hasEntryNamed: 'first command').
	group unregister: firstCommand.
	self deny: (group hasEntryNamed: 'first command').
	
	self assert: (group hasEntryNamed: 'sub group 1').
	group unregister: subGroup1.
	self deny: (group hasEntryNamed: 'sub group 1').
]
