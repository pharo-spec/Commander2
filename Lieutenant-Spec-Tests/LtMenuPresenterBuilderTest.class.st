"
A LtMenuPresenterBuilderTest is a test class for testing the behavior of LtMenuPresenterBuilder
"
Class {
	#name : #LtMenuPresenterBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'menuBuilder',
		'commandsGroup'
	],
	#category : #'Lieutenant-Spec-Tests'
}

{ #category : #running }
LtMenuPresenterBuilderTest >> setUp [
	super setUp.
	menuBuilder := LtMenuPresenterBuilder new.
	
	commandsGroup := (LtCommandsGroup named: 'root') asSpecGroup
							register: (LtBlockCommand new
											basicName: 'c1';
											block: [ ];
											yourself) asSpecCommand;
							register: ((LtCommandsGroup named: 'sub1') asSpecGroup
											register: (LtBlockCommand new
															basicName: 'c2';
															block: [ ];
															yourself) asSpecCommand;
											register: (LtBlockCommand new
															basicName: 'c3';
															block: [ ];
															yourself) asSpecCommand);
							register: (LtBlockCommand new
											basicName: 'c4';
											block: [ ];
											yourself) asSpecCommand.
]

{ #category : #test }
LtMenuPresenterBuilderTest >> testVisitLtCommand [
	| menuItem evaluationResult |
	evaluationResult := nil.
	self assert: menuBuilder menuPresenter defaultGroup menuItems isEmpty.
	
	(LtBlockCommand new
		basicName: 'c';
		basicDescription: 'desc';
		context: [ 41 ];
		block: [ :x | evaluationResult := x + 1 ];
		yourself) asSpecCommand acceptVisitor: menuBuilder.
		
	self assert: menuBuilder menuPresenter defaultGroup menuItems size equals: 1.
	menuItem := menuBuilder menuPresenter defaultGroup menuItems first.
	self assert: menuItem class equals: MenuItemPresenter.
	self assert: menuItem name equals: 'c'.
	self assert: menuItem description equals: 'desc'.
	
	self assert: evaluationResult isNil.
	menuItem action value.
	self assert: evaluationResult equals: 42.
]

{ #category : #test }
LtMenuPresenterBuilderTest >> testVisitLtCommandsGroup [

	self flag: #toImplement.
	self assert: false
]
