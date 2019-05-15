"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#openPreviewToApplySelectedChanges.
Name and description extracted from: EpLogBrowserPresenter>>#codeChangesMenuActions
"
Class {
	#name : #EpOpenPreviewToApplySelectedChanges,
	#superclass : #CmCommand,
	#category : #'Commander2-Epicea'
}

{ #category : #decorating }
EpOpenPreviewToApplySelectedChanges >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallRedoIcon;
		shortcutKey: $p command;
		yourself
]

{ #category : #hooks }
EpOpenPreviewToApplySelectedChanges >> execute [
	| entries previewLog |
	entries := self context selectedCodeChanges.
	entries ifEmpty: [ ^ self context inform: 'No changes to preview apply' ].

	previewLog := EpLogBrowserOperationFactory new
		logBrowserModel: self context;
		entries: entries;
		errorHandlerBlock: self context operationsErrorHandlerBlock;
		newApplyPreviewLog.

	previewLog isEmpty
		ifTrue: [ self context inform: 'Preview is empty (no changes to apply in current image)' ]
		ifFalse: [ previewLog browseEvents beApplyMode ]
]

{ #category : #initialization }
EpOpenPreviewToApplySelectedChanges >> initialize [
	super initialize.
	self
		basicName: 'Apply...';
		basicDescription: 'Preview the application of selected code changes (open a new window to show the effect of re-applying the changes in current image)'
]
