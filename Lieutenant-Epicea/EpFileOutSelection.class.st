"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#fileOutSelection.
Name and description extracted from: EpLogBrowserPresenter>>#addMenuItemsForSelectedItemsIn:
"
Class {
	#name : #EpFileOutSelection,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #decorating }
EpFileOutSelection >> asSpecCommand [
	^ super asSpecCommand
		icon: #smallSaveAsIcon;
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
		name: 'File Out';
		description: 'Write selected entries to an Ombu file'
]
