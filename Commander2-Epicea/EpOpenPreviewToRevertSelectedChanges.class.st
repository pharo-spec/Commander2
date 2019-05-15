"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#openPreviewToRevertSelectedChanges.
Name and description extracted from: EpLogBrowserPresenter>>#codeChangesMenuActions
"
Class {
	#name : #EpOpenPreviewToRevertSelectedChanges,
	#superclass : #CmCommand,
	#category : #'Commander2-Epicea'
}

{ #category : #decorating }
EpOpenPreviewToRevertSelectedChanges >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallUndoIcon;
		shortcutKey: $r command;
		yourself
]

{ #category : #hooks }
EpOpenPreviewToRevertSelectedChanges >> execute [
	| entries previewLog |
	entries := self context selectedCodeChanges.
	entries ifEmpty: [ ^ self context inform: 'No changes to preview revert' ].

	previewLog := EpLogBrowserOperationFactory new
		logBrowserModel: self context;
		entries: entries;
		errorHandlerBlock: self context operationsErrorHandlerBlock;
		newRevertPreviewLog.

	previewLog isEmpty
		ifTrue: [ self context inform: 'Preview is empty (no changes to revert in current image)' ]
		ifFalse: [ previewLog browseEvents beRevertMode ]
]

{ #category : #initialization }
EpOpenPreviewToRevertSelectedChanges >> initialize [
	super initialize.
	self
		basicName: 'Revert...';
		basicDescription: 'Preview the reversion of selected code changes (open a new window to show the effect of reverting the changes in current image)'
]
