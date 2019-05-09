Class {
	#name : #LtContactBookPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'table',
		'contactBook'
	],
	#category : #'Lieutenant-ContactBook-Spec'
}

{ #category : #commands }
LtContactBookPresenter class >> buildAddingGroupWith: presenterIntance [
	^ (LtCommandsGroup named: 'Adding') asSpecGroup
		register: (LtAddContactCommand forSpec context: presenterIntance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #commands }
LtContactBookPresenter class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [
	rootCommandGroup
		register: (self buildEditionGroupWith: presenterIntance);
		register: (self buildAddingGroupWith: presenterIntance);
		register: (self buildRemovingGroupWith: presenterIntance)
]

{ #category : #commands }
LtContactBookPresenter class >> buildEditionGroupWith: presenterIntance [
	^ (LtCommandsGroup named: 'Edition') asSpecGroup
		register: (LtRenameContactCommand forSpec context: presenterIntance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #commands }
LtContactBookPresenter class >> buildRemovingGroupWith: presenterIntance [
	^ (LtCommandsGroup named: 'Removing') asSpecGroup
		register: (LtRemoveContactCommand forSpec context: presenterIntance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #examples }
LtContactBookPresenter class >> coworkersExample [
	<example>
	^ (self on: LtContactBook coworkers) openWithSpec 
]

{ #category : #examples }
LtContactBookPresenter class >> defaultSpec [

	^ SpecLayout composed
		newColumn: [ :column |
			column add: #table];
		yourself
]

{ #category : #examples }
LtContactBookPresenter class >> familyExample [
	<example>
	^ (self on: LtContactBook family) openWithSpec 
]

{ #category : #accessing }
LtContactBookPresenter >> contactBook [
	^ contactBook
]

{ #category : #context }
LtContactBookPresenter >> createCommandContext [
	^self createCommandContextForSelection: table selectedItems
]

{ #category : #context }
LtContactBookPresenter >> createCommandContextForSelection: selectedContacts [
	^CmdContactBookPresenterContext for: self of: selectedContacts
]

{ #category : #shortcut }
LtContactBookPresenter >> ensureKeyBindingsFor: aWidget [
	
	^self enableCommanderShortcutsIn: aWidget
]

{ #category : #initialization }
LtContactBookPresenter >> initializeWidgets [
	table := self newTable.
	table 
		addColumn: (StringTableColumn title: 'Name' evaluated: #name);
		addColumn: (StringTableColumn title: 'Phone' evaluated: #phone).
	table contextMenu: [ self rootCommandsGroup asMenuPresenter ].
	
	table items: contactBook contents.
	
	
]

{ #category : #testing }
LtContactBookPresenter >> isContactSelected [
	^table selectedItem notNil
]

{ #category : #accessing }
LtContactBookPresenter >> selectedContact [
	^table selectedItem
]

{ #category : #accessing }
LtContactBookPresenter >> selectedContacts [
	^table selectedItems
]

{ #category : #initialization }
LtContactBookPresenter >> setModelBeforeInitialization: aContactBook [
	super setModelBeforeInitialization: aContactBook.
	contactBook := aContactBook
]

{ #category : #accessing }
LtContactBookPresenter >> table [
	^ table
]

{ #category : #accessing }
LtContactBookPresenter >> table: anObject [
	table := anObject
]

{ #category : #updating }
LtContactBookPresenter >> updateView [
	table items: contactBook contents
]
