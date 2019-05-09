"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#applyPropagateRefactoringInSelection.
Name and description extracted from: EpLogBrowserPresenter>>#refactoringMenuActions
"
Class {
	#name : #EpApplyPropagateRefactoringInSelection,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #decorating }
EpApplyPropagateRefactoringInSelection >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallRedoIcon;
		shortcutKey: $s command;
		yourself
]

{ #category : #hooks }
EpApplyPropagateRefactoringInSelection >> execute [
	| entries |
	entries := self context selectedEntries.
	entries size = 1 ifFalse: [ 
		^ self context inform: 'Please select one refactoring' ]. "Only implemented for one"
	
	EpLogBrowserOperationFactory new
		logBrowserModel: self context;
		entries: entries;
		errorHandlerBlock: self context operationsErrorHandlerBlock;
		applyPropagateRefactoring.

]

{ #category : #initialization }
EpApplyPropagateRefactoringInSelection >> initialize [
	super initialize.
	self
		basicName: 'Apply secondary effects of refactoring';
		basicDescription: 'Apply only the secondary effects of the selected refactoring'
]
