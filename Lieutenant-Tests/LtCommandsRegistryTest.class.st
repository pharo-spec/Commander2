"
A LtCommandsRegistryTest is a test class for testing the behavior of LtCommandsRegistry
"
Class {
	#name : #LtCommandsRegistryTest,
	#superclass : #TestCase,
	#instVars : [
		'registry'
	],
	#category : #'Lieutenant-Tests'
}

{ #category : #running }
LtCommandsRegistryTest >> setUp [
	super setUp.
	registry := LtCommandsRegistry new
]

{ #category : #test }
LtCommandsRegistryTest >> testAllCommands [
	| command |
	self assert: registry allCommands isEmpty.
	command := LtSimpleRenameContactCommand new.
	registry registerCommand: command underCategory: #tests withContextBlock: [ { Contact new . 'John' } ].
	
	self assert: registry allCommands size equals: 1.
	self assert: registry allCommands anyOne equals: command
]

{ #category : #test }
LtCommandsRegistryTest >> testHasCommand [
	| command |
	command := LtSimpleRenameContactCommand new.
	self deny: (registry hasCommand: command).
	
	registry registerCommand: command underCategory: #tests withContextBlock: [ { Contact new . 'John' } ].
	
	self assert: (registry hasCommand: command).
]

{ #category : #test }
LtCommandsRegistryTest >> testRegisterCommandUnderCategoryWithContextBlock [
	| dict command |
	self assert: registry categoriesToCommands isEmpty.
	command := LtSimpleRenameContactCommand new.
	registry registerCommand: command underCategory: #tests withContextBlock: [ { Contact new . 'John' } ].
	
	dict := registry categoriesToCommands.
	self assert: dict size equals: 1.
	self assert: (dict at: #tests) size equals: 1.
	self assert: (dict at: #tests) anyOne equals: command.
	
	self should: [ registry registerCommand: command underCategory: #tests. ] raise: Error.
	
	self should: [ registry registerCommand: command underCategory: #foo. ] raise: Error.
]

{ #category : #test }
LtCommandsRegistryTest >> testUnregisterCommand [
	| command |
	command := LtSimpleRenameContactCommand new.
	registry registerCommand: command underCategory: #tests withContextBlock: [ { Contact new . 'John' } ].
	
	self assert: registry allCommands size equals: 1.
	
	registry unregisterCommand: command.
	
	self assert: registry allCommands size equals: 0
]
