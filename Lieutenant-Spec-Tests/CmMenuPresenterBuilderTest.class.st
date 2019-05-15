"
A LtMenuPresenterBuilderTest is a test class for testing the behavior of LtMenuPresenterBuilder
"
Class {
	#name : #CmMenuPresenterBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'menuBuilder',
		'commandsGroup'
	],
	#category : #'Lieutenant-Spec-Tests'
}

{ #category : #running }
CmMenuPresenterBuilderTest >> setUp [
	super setUp.
	menuBuilder := LtMenuPresenterBuilder new.
	
	commandsGroup := (LtCommandsGroup named: 'root') asSpecGroup beRoot
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
											yourself) asSpecCommand;
							yourself.
]

{ #category : #test }
CmMenuPresenterBuilderTest >> testVisitLtCommand [
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
CmMenuPresenterBuilderTest >> testVisitLtCommandThatCantBeRun [
	self assert: menuBuilder menuPresenter defaultGroup menuItems isEmpty.
	
	(LtBlockCommand new
		basicName: 'c';
		basicDescription: 'desc';
		context: [ 41 ];
		canBeRunBlock: [ :x | x = 42 ];
		block: [ :x | 42 ];
		yourself) asSpecCommand acceptVisitor: menuBuilder.
		
	self assert: menuBuilder menuPresenter defaultGroup menuItems isEmpty.
]

{ #category : #test }
CmMenuPresenterBuilderTest >> testVisitLtCommandsGroup [
	| menuItems |
	self assert: menuBuilder menuPresenter defaultGroup menuItems isEmpty.
	
	commandsGroup acceptVisitor: menuBuilder.
	
	menuItems := menuBuilder menuPresenter defaultGroup menuItems.
	self assert: menuItems size equals: 3.
	self assert: menuItems first class equals: MenuItemPresenter.
	self assert: menuItems first name equals: commandsGroup entries first name.
	self assert: menuItems first description equals: commandsGroup entries first description.
	self assert: menuItems first subMenu isNil.
	self assert: menuItems second class equals: MenuItemPresenter.
	self assert: menuItems second name equals: commandsGroup entries second name.
	self assert: menuItems second description equals: commandsGroup entries second description.
	self assert: menuItems second subMenu isNotNil.
	self assert: menuItems second subMenu class equals: MenuPresenter.
	self assert: menuItems second subMenu menuGroups size equals: 1.
	self assert: menuItems second subMenu menuGroups first menuItems size equals: 2.
	self assert: menuItems second subMenu menuGroups first menuItems first class equals: MenuItemPresenter.
	self assert: menuItems second subMenu menuGroups first menuItems first name equals: commandsGroup entries second entries first name.
	self assert: menuItems second subMenu menuGroups first menuItems first description equals: commandsGroup entries second entries first description.
	self assert: menuItems second subMenu menuGroups first menuItems second class equals: MenuItemPresenter.
	self assert: menuItems second subMenu menuGroups first menuItems second name equals: commandsGroup entries second entries second name.
	self assert: menuItems second subMenu menuGroups first menuItems second description equals: commandsGroup entries second entries second description.
	self assert: menuItems third class equals: MenuItemPresenter.
	self assert: menuItems third name equals: commandsGroup entries third name.
	self assert: menuItems third description equals: commandsGroup entries third description.
	self assert: menuItems third subMenu isNil.
]
