Class {
	#name : #ContactBookPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'table',
		'contactBook'
	],
	#category : #'Lieutenant-Example'
}

{ #category : #specs }
ContactBookPresenter class >> defaultSpec [
        ^ SpecLayout composed
          newColumn: [ :c | c add: #table ];
          yourself
]

{ #category : #example }
ContactBookPresenter class >> familyExample [
        <sampleInstance>
        ^ (self on: ContactBook family) openWithSpec
]

{ #category : #accessing }
ContactBookPresenter >> contactBook [
	^ contactBook
]

{ #category : #accessing }
ContactBookPresenter >> contactBook: aBook [
	contactBook := aBook
]

{ #category : #initialization }
ContactBookPresenter >> initializeWidgets [
	table := self newList.
	table numberOfColumns: 2 withWidths: #(250 250).
	table
		displayBlock: [ :contact | 
			{contact name.
			contact phone} ].
	table items: contactBook contents.
	table menu:
				[ self menuForContactBook ].
]

{ #category : #initialization }
ContactBookPresenter >> menuForContactBook [
	| aMenu |
	aMenu := MenuPresenter new.
	aMenu addGroup: [ :aGroup | 
							aGroup 
								addItem:
									[ :anItem | 
									anItem name:'Rename';
									icon: (self iconNamed: #smallFindIcon);
									action: self rename
									]].
	
]

{ #category : #'model access' }
ContactBookPresenter >> setModelBeforeInitialization: aDomainObject [
        contactBook := aDomainObject
]

{ #category : #accessing }
ContactBookPresenter >> table [
	^ table
]

{ #category : #accessing }
ContactBookPresenter >> table: anObject [
	table := anObject
]
