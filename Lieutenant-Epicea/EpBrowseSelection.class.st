"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#browseSelection.
Name and description extracted from: EpLogBrowserPresenter>>#codeChangesMenuActions
"
Class {
	#name : #EpBrowseSelection,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #decorating }
EpBrowseSelection >> asSpecCommand [
	^ super asSpecCommand
		iconName: #nautilusIcon;
		shortcutKey: $b command;
		yourself
]

{ #category : #hooks }
EpBrowseSelection >> execute [
	| selectionSize |
	selectionSize := self context selectedEntryReferences size.	
	selectionSize > 3 ifTrue: [
		(self context confirm: 'Do you want to open a browser for each code changes? (', selectionSize asString, ' items selected)')
			ifFalse: [ ^self ] ].

	self context selectedEntryItems 
		select: [ :each | each entry content isCodeChange ] 
		thenDo: [ :each | each browseItem ]
]

{ #category : #initialization }
EpBrowseSelection >> initialize [
	super initialize.
	self
		basicName: 'Browse current';
		basicDescription: 'Browse working copy of entity affected in the selected event(s)'
]
