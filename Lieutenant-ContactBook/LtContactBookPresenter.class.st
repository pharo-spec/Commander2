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
		basicDescription: 'Commands related to contact addition.';
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
		basicDescription: 'Commands related to contact edition.';
		register: (LtRenameContactCommand forSpec context: presenterIntance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #commands }
LtContactBookPresenter class >> buildRemovingGroupWith: presenterIntance [
	^ (LtCommandsGroup named: 'Removing') asSpecGroup
		basicDescription: 'Command related to contact removal.';
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

{ #category : #initialization }
LtContactBookPresenter >> initializeWidgets [
	table := self newTable.
	table 
		addColumn: (StringTableColumn title: 'Name' evaluated: #name);
		addColumn: (StringTableColumn title: 'Phone' evaluated: #phone).
	
	table contextMenu: [ self rootCommandsGroup asMenuPresenter ].
	
	table items: contactBook contents
]

{ #category : #initialization }
LtContactBookPresenter >> initializeWindow: aWindowPresenter [
	super initializeWindow: aWindowPresenter.
	
	self rootCommandsGroup installShortcutsIn: aWindowPresenter
]

{ #category : #testing }
LtContactBookPresenter >> isContactSelected [
	^table selectedItem notNil
]

{ #category : #'user interaction' }
LtContactBookPresenter >> newContact [
	| rawData splitted |
	rawData := self request: 'Enter new contact name and phone (split by comma)' initialAnswer: '' title: 'Create new contact'.
	
	splitted := rawData splitOn: $,.
	
	(splitted size = 2 and: [ splitted allSatisfy: #isNotEmpty ])
		ifFalse: [ InvalidUserInput signal: 'Please enter contact name and phone (split by comma)'  ].
	
	^ LtContact new
		name: splitted first;
		phone: splitted second;
		yourself
]

{ #category : #'user interaction' }
LtContactBookPresenter >> newName [
	| newName |
	newName := self request: 'New name of the contact' initialAnswer: self selectedContact name title: 'Rename a contact'.
		
	(newName isEmpty)
		ifTrue: [ 
			InvalidUserInput signal: 'The contact name can not be empty' ].
	
	^ newName
]

{ #category : #'user interaction' }
LtContactBookPresenter >> newPhone [
	| phone |
	phone := self request: 'New phone for the contact' initialAnswer: self selectedContact phone title: 'Set new phone for contact'.
		
	(phone matchesRegex: '\d\d\d\s\d\d\d')
		ifFalse: [ 
			InvalidUserInput signal: 'The phone number is not well formated. Should match "\d\d\d\s\d\d\d"' ].
	
	^ phone
]

{ #category : #'user interaction' }
LtContactBookPresenter >> removeContact: aLtContact [
	| confirm |
	confirm := self confirm: ('Are you sure you want to remove {1} contact' format: { aLtContact name }) label: 'Remove the contact'.
	confirm
		ifTrue: [ self contactBook removeContact: aLtContact ]
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
