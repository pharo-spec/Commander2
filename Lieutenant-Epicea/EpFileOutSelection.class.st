"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#fileOutSelection.
Name and description extracted from: EpLogBrowserPresenter>>#addMenuItemsForSelectedItemsIn:
"
Class {
	#name : #EpFileOutSelection,
	#superclass : #CmCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #decorating }
EpFileOutSelection >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallSaveAsIcon;
		yourself
]

{ #category : #hooks }
EpFileOutSelection >> execute [
	| entries outputDirectory |
	entries := self context selectedEntryItems collect: [ :each | each entry ].
	outputDirectory := self context log store directory.
	
	EpOmbuExporter askFileNameAndFileOut: entries in: outputDirectory.
]

{ #category : #initialization }
EpFileOutSelection >> initialize [
	super initialize.
	self
		basicName: 'File Out';
		basicDescription: 'Write selected entries to an Ombu file'
]
