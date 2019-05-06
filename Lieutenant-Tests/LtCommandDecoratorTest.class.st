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
	#category : #'Lieutenant-Tests'
}

{ #category : #running }
LtCommandDecoratorTest >> setUp [
	super setUp.
	commandToBeDecorated := LtCommand new.
	
	commandToBeDecorated
		basicName: 'command for test';
		basicDescription: 'This command is only cerated for the purpose of unit tests.';
		context: Object new.
		
	decorator := LtCommandDecorator decorate: commandToBeDecorated
]

{ #category : #test }
LtCommandDecoratorTest >> testBasicName [
	self assert: decorator basicName equals: commandToBeDecorated basicName
]

{ #category : #test }
LtCommandDecoratorTest >> testContext [
	self assert: decorator context equals: commandToBeDecorated context
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
	self assert: decorator basicDescription equals: commandToBeDecorated basicDescription
]

{ #category : #test }
LtCommandDecoratorTest >> testName [
	self assert: decorator name equals: commandToBeDecorated name
]
