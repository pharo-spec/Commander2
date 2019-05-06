"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#applyCompleteRefactoringInSelection.
Name and description extracted from: EpLogBrowserPresenter>>#refactoringMenuActions
"
Class {
	#name : #EpApplyCompleteRefactoringInSelection,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #decorating }
EpApplyCompleteRefactoringInSelection >> asSpecCommand [
	^ super asSpecCommand
		iconNamed: #smallRedoIcon;
		shortcutKey: $y command;
		yourself
]

{ #category : #hooks }
EpApplyCompleteRefactoringInSelection >> execute [
	| entries |
	entries := self context selectedEntries.
	entries size = 1 ifFalse: [ 
		^ self context inform: 'Please select one refactoring' ]. "Only implemented for one"
	
	EpLogBrowserOperationFactory new
		logBrowserModel: self context;
		entries: entries;
		errorHandlerBlock: self context operationsErrorHandlerBlock;	
		applyCompleteRefactoring.
]

{ #category : #initialization }
EpApplyCompleteRefactoringInSelection >> initialize [
	super initialize.
	self
		basicName: 'Apply refactoring';
		description: 'Apply selected refactoring'
]
