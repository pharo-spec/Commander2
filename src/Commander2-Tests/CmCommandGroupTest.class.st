"
A LtCommandsRegistryTest is a test class for testing the behavior of LtCommandsRegistry
"
Class {
	#name : #CmCommandGroupTest,
	#superclass : #TestCase,
	#instVars : [
		'firstCommand',
		'subCommand1',
		'group',
		'subGroup1',
		'subGroup2'
	],
	#category : #'Commander2-Tests'
}

{ #category : #running }
CmCommandGroupTest >> setUp [
	super setUp.
	group := CmCommandGroup named: 'main group'.
	firstCommand := CmBlockCommand new
							basicName: 'first command';
							block: [ :x | x ];
							context: [ 1 ];
							yourself.
	
	
	subCommand1 :=  CmBlockCommand new
							basicName: 'sub command 1';
							block: [ :x | x ];
							context: [ 11 ];
							yourself.
	
	subGroup1 := (CmCommandGroup named: 'sub group 1')
							register: subCommand1;
							yourself.
	
	subGroup2 := CmCommandGroup named: 'sub group 2'. "Empty on purpose."
	
	group
		register: firstCommand;
		register: subGroup1;
		register: subGroup2
]

{ #category : #test }
CmCommandGroupTest >> testAllCommands [
	self assertCollection: group allCommands equals: { firstCommand . subCommand1 } asOrderedCollection
]

{ #category : #test }
CmCommandGroupTest >> testCommandOrGroupNamed [
	self assert: (group commandOrGroupNamed: 'first command') equals: firstCommand.
	self assert: (group commandOrGroupNamed: 'sub group 1') equals: subGroup1.
	self assert: (group commandOrGroupNamed: 'sub group 2') equals: subGroup2.	
	
	self should: [ group commandOrGroupNamed: 'unknown' ] raise: NotFound.
	
	self assert: ((group commandOrGroupNamed: 'sub group 1') commandOrGroupNamed: 'sub command 1') equals: subCommand1.
]

{ #category : #test }
CmCommandGroupTest >> testCommands [
	self assertCollection: group commands equals: { firstCommand } asOrderedCollection
]

{ #category : #test }
CmCommandGroupTest >> testEntries [
	self assert: (group entries allSatisfy: [ :e | e isCommand or: [ e isGroup ] ]).
	self assertCollection: (group entries) equals: { firstCommand . subGroup1 . subGroup2 } asOrderedCollection
]

{ #category : #test }
CmCommandGroupTest >> testGroups [
	self assertCollection: group groups equals: { subGroup1. subGroup2 } asOrderedCollection
]

{ #category : #test }
CmCommandGroupTest >> testHasCommand [
	self deny: (group hasCommand: CmCommand new).
	
	self assert: (group hasCommand: firstCommand)
]

{ #category : #test }
CmCommandGroupTest >> testHasEntryNamed [
	self deny: (group hasEntryNamed: 'nope').
	
	self assert: (group hasEntryNamed: 'first command').
	
	self deny: (group hasEntryNamed: 'sub command 1').
]

{ #category : #test }
CmCommandGroupTest >> testInitialize [
	| newGroup |
	newGroup := CmCommandGroup new.
	
	self assert: newGroup basicName equals: CmCommandGroup defaultName.
	self assert: newGroup entries isEmpty
]

{ #category : #test }
CmCommandGroupTest >> testRegisterAfter [
	| command |
	command := CmBlockCommand new
							basicName: 'added after command';
							block: [ :x | x ];
							context: [ 1 ];
							yourself.
							
	self assert: group entries third equals: subGroup2.
	
	group register: command after: subGroup1.
	self deny: group entries third equals: subGroup2.
	self assert: group entries third equals: command.
]

{ #category : #test }
CmCommandGroupTest >> testRegisterBefore [
	| command |
	command := CmBlockCommand new
							basicName: 'added before command';
							block: [ :x | x ];
							context: [ 1 ];
							yourself.
							
	self assert: group entries second equals: subGroup1.
	
	group register: command before: subGroup1.
	self deny: group entries second equals: subGroup1.
	self assert: group entries second equals: command.
]

{ #category : #test }
CmCommandGroupTest >> testRegisterCommandWithContext [
	| secondCommand |
	self deny: (group hasEntryNamed: 'second command').
	
	secondCommand := CmBlockCommand new 
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
CmCommandGroupTest >> testRegisterCommandWithContextBlock [
	| secondCommand secondCommandWithSameName |
	self deny: (group hasEntryNamed: 'second command').
	
	secondCommand := CmBlockCommand new 
							basicName: 'second command';
							block: [ :x | x ];
							context: [ 42 ];
							yourself.
	group register: secondCommand.
	
	self assert: (group hasEntryNamed: 'second command').
	self assert: (group commandOrGroupNamed: 'second command') equals: secondCommand.
	
	secondCommandWithSameName := CmBlockCommand new 
											basicName: 'second command';
											block: [ :x | x ];
											context: [ ];
											yourself.
	
	self
		should: [ group register: secondCommandWithSameName]
		raise: CmDuplicatedEntryName
		withExceptionDo: [ :error |
			self assert: error entryName equals: 'second command' ]
]

{ #category : #test }
CmCommandGroupTest >> testRegisterFirst [
	| command oldFirst |
	command := CmBlockCommand new
							basicName: 'added first command';
							block: [ :x | x ];
							context: [ 1 ];
							yourself.
							
	self deny: group entries first equals: command.
	oldFirst := group entries first.
	
	group registerFirst: command.
	self assert: group entries first equals: command.
	self assert: group entries second equals: oldFirst.
]

{ #category : #test }
CmCommandGroupTest >> testRegisterInsteadOf [
	| command |
	command := CmBlockCommand new
							basicName: 'added first command';
							block: [ :x | x ];
							context: [ 1 ];
							yourself.
	
	self deny: (group hasCommand: command).
	self assert: group entries second equals: subGroup1.
	
	group register: command insteadOf: subGroup1.
	
	self assert: group entries second equals: command.
	self deny: (group hasGroup: subGroup1)
]

{ #category : #test }
CmCommandGroupTest >> testRegisterLast [
	| command oldLast |
	command := CmBlockCommand new
							basicName: 'last first command';
							block: [ :x | x ];
							context: [ 1 ];
							yourself.
							
	self deny: group entries last equals: command.
	oldLast := group entries last.
	
	group registerLast: command.
	self assert: group entries last equals: command.
	self assert: group entries allButLast last equals: oldLast.
]

{ #category : #test }
CmCommandGroupTest >> testRegisterSubRegister [
	| subGroup3 |
	self deny: (group hasEntryNamed: 'sub group 3').
	
	subGroup3 := CmCommandGroup named: 'sub group 3'.
	group register: subGroup3.
	
	self assert: (group hasEntryNamed: 'sub group 3').
	self assert: (group commandOrGroupNamed: 'sub group 3') equals: subGroup3.
	
	self
		should: [ group register: (CmCommandGroup named: 'sub group 3') ]
		raise: CmDuplicatedEntryName
		withExceptionDo: [ :error |
			self assert: error entryName equals: 'sub group 3' ]
]

{ #category : #test }
CmCommandGroupTest >> testUnregister [
	self assert: (group hasEntryNamed: 'first command').
	group unregister: firstCommand.
	self deny: (group hasEntryNamed: 'first command').
	
	self assert: (group hasEntryNamed: 'sub group 1').
	group unregister: subGroup1.
	self deny: (group hasEntryNamed: 'sub group 1').
]
