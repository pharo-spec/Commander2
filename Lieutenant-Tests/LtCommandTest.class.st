Class {
	#name : #LtCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'Lieutenant-Tests'
}

{ #category : #running }
LtCommandTest >> setUp [
	super setUp.
	command := LtFakeCommand new.
]

{ #category : #test }
LtCommandTest >> testBasicDescription [
	self assert: command basicDescription equals: 'I am a fake command for testing purposes.'.
]

{ #category : #test }
LtCommandTest >> testBasicName [
	self assert: command basicName equals: 'Fake command'.
]

{ #category : #test }
LtCommandTest >> testCanBeRun [
	command context: 0. "Need to set context before because the command expects it."
	self deny: command canBeRun.
	
	command context: 42.
	self assert: command canBeRun.
]

{ #category : #test }
LtCommandTest >> testContext [
	self assert: command context isNil.
	
	command context: 42.
	
	self assert: command context equals: 42.
	
	command context: [ 41 + 1 ].
	
	self assert: command context equals: 42.
]

{ #category : #test }
LtCommandTest >> testDescription [
	command context: 42.
	
	self assert: command description equals: command basicDescription , ' 42'
]

{ #category : #test }
LtCommandTest >> testHasContext [
	self deny: command hasContext.
	
	command context: 42.
	
	self assert: command hasContext.
	
	command context: [ 42 ].
	
	self assert: command hasContext.
]

{ #category : #test }
LtCommandTest >> testName [
	command context: 42.
	
	self assert: command name equals: command basicName , ' 42'
]
