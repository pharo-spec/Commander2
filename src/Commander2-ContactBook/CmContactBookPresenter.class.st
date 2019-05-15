"
I am a presenter for a contact book.

I provide a nice UI to manage the contacts of the contact book I am opened on.

Check my class-side for example.
"
Class {
	#name : #CmContactBookPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'table',
		'contactBook'
	],
	#category : #'Commander2-ContactBook-Spec'
}

{ #category : #commands }
CmContactBookPresenter class >> buildAddingGroupWith: presenterIntance [
	^ (CmCommandGroup named: 'Adding') asSpecGroup
		basicDescription: 'Commands related to contact addition.';
		register: (CmAddContactCommand forSpec context: presenterIntance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #commands }
CmContactBookPresenter class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [
	rootCommandGroup
		register: (self buildEditionGroupWith: presenterIntance);
		register: (self buildAddingGroupWith: presenterIntance);
		register: (self buildRemovingGroupWith: presenterIntance)
]

{ #category : #commands }
CmContactBookPresenter class >> buildEditionGroupWith: presenterIntance [
	^ (CmCommandGroup named: 'Edition') asSpecGroup
		basicDescription: 'Commands related to contact edition.';
		register: (CmRenameContactCommand forSpec context: presenterIntance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #commands }
CmContactBookPresenter class >> buildRemovingGroupWith: presenterIntance [
	^ (CmCommandGroup named: 'Removing') asSpecGroup
		basicDescription: 'Command related to contact removal.';
		register: (CmRemoveContactCommand forSpec context: presenterIntance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #examples }
CmContactBookPresenter class >> coworkersExample [
	<example>
	^ (self on: CmContactBook coworkers) openWithSpec 
]

{ #category : #examples }
CmContactBookPresenter class >> defaultSpec [

	^ SpecLayout composed
		newColumn: [ :column |
			column add: #table];
		yourself
]

{ #category : #examples }
CmContactBookPresenter class >> familyExample [
	<example>
	^ (self on: CmContactBook family) openWithSpec 
]

{ #category : #accessing }
CmContactBookPresenter >> contactBook [
	^ contactBook
]

{ #category : #initialization }
CmContactBookPresenter >> initializeWidgets [
	table := self newTable.
	table 
		addColumn: (StringTableColumn title: 'Name' evaluated: #name);
		addColumn: (StringTableColumn title: 'Phone' evaluated: #phone).
	
	table contextMenu: [ self rootCommandsGroup asMenuPresenter ].
	
	table items: contactBook contents
]

{ #category : #initialization }
CmContactBookPresenter >> initializeWindow: aWindowPresenter [
	
	super initializeWindow: aWindowPresenter.
	self rootCommandsGroup installShortcutsIn: aWindowPresenter
]

{ #category : #testing }
CmContactBookPresenter >> isContactSelected [
	^table selectedItem notNil
]

{ #category : #'user interaction' }
CmContactBookPresenter >> newContact [
	| rawData splitted |
	rawData := self request: 'Enter new contact name and phone (split by comma)' initialAnswer: '' title: 'Create new contact'.
	
	splitted := rawData splitOn: $,.
	
	(splitted size = 2 and: [ splitted allSatisfy: #isNotEmpty ])
		ifFalse: [ InvalidUserInput signal: 'Please enter contact name and phone (split by comma)'  ].
	
	^ CmContact new
		name: splitted first;
		phone: splitted second;
		yourself
]

{ #category : #'user interaction' }
CmContactBookPresenter >> newName [
	| newName |
	newName := self request: 'New name of the contact' initialAnswer: self selectedContact name title: 'Rename a contact'.
		
	(newName isEmpty)
		ifTrue: [ 
			InvalidUserInput signal: 'The contact name can not be empty' ].
	
	^ newName
]

{ #category : #'user interaction' }
CmContactBookPresenter >> newPhone [
	| phone |
	phone := self request: 'New phone for the contact' initialAnswer: self selectedContact phone title: 'Set new phone for contact'.
		
	(phone matchesRegex: '\d\d\d\s\d\d\d')
		ifFalse: [ 
			InvalidUserInput signal: 'The phone number is not well formated. Should match "\d\d\d\s\d\d\d"' ].
	
	^ phone
]

{ #category : #'user interaction' }
CmContactBookPresenter >> removeContact: aCmContact [
	| confirm |
	confirm := self confirm: ('Are you sure you want to remove {1} contact' format: { aCmContact name }) label: 'Remove the contact'.
	confirm
		ifTrue: [ self contactBook removeContact: aCmContact ]
]

{ #category : #accessing }
CmContactBookPresenter >> selectedContact [
	^table selectedItem
]

{ #category : #accessing }
CmContactBookPresenter >> selectedContacts [
	^table selectedItems
]

{ #category : #initialization }
CmContactBookPresenter >> setModelBeforeInitialization: aContactBook [
	super setModelBeforeInitialization: aContactBook.
	contactBook := aContactBook
]

{ #category : #accessing }
CmContactBookPresenter >> table [
	^ table
]

{ #category : #accessing }
CmContactBookPresenter >> table: anObject [
	table := anObject
]

{ #category : #updating }
CmContactBookPresenter >> updateView [
	table items: contactBook contents
]
