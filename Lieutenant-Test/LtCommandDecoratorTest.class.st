"
A LtCommandDecoratorTest is a test class for testing the behavior of LtCommandDecorator
"
Class {
	#name : #LtCommandDecoratorTest,
	#superclass : #TestCase,
	#instVars : [
		'commandToBeDecorated',
		'decorator'
	],
	#category : #'Lieutenant-Test'
}

{ #category : #running }
LtCommandDecoratorTest >> setUp [
	super setUp.
	commandToBeDecorated := LtCommand new.
	
	commandToBeDecorated
		name: 'command for test';
		description: 'This command is only cerated for the purpose of unit tests.'.
		
	decorator := LtCommandDecorator decorate: commandToBeDecorated
]

{ #category : #test }
LtCommandDecoratorTest >> testCanBeExecutedIn [
	self assert: (decorator canBeExecutedIn: Object new) equals: (commandToBeDecorated canBeExecutedIn: Object new)
]

{ #category : #tests }
LtCommandDecoratorTest >> testDecorate [
	self assert: decorator class equals: LtCommandDecorator.
	self assert: decorator decoratedCommand equals: commandToBeDecorated
]

{ #category : #test }
LtCommandDecoratorTest >> testDecoratedCommand [
	self assert: decorator decoratedCommand equals: commandToBeDecorated
]

{ #category : #test }
LtCommandDecoratorTest >> testDescription [
	self assert: decorator description equals: commandToBeDecorated description
]

{ #category : #test }
LtCommandDecoratorTest >> testName [
	self assert: decorator name equals: commandToBeDecorated name
]
