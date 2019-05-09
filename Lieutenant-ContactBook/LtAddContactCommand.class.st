Class {
	#name : #LtAddContactCommand,
	#superclass : #LtContactBookCommand,
	#instVars : [
		'contactName',
		'contactPhone'
	],
	#category : #'Lieutenant-ContactBook-Commands'
}

{ #category : #accessing }
LtAddContactCommand >> contactName [
	^ contactName
]

{ #category : #accessing }
LtAddContactCommand >> contactName: anObject [
	contactName := anObject
]

{ #category : #accessing }
LtAddContactCommand >> contactPhone [
	^ contactPhone
]

{ #category : #accessing }
LtAddContactCommand >> contactPhone: anObject [
	contactPhone := anObject
]

{ #category : #hooks }
LtAddContactCommand >> execute [
	"One should never manipulate UI directly from a commande.
	 Instead, you can use one of the subclass of LtCommandNotification.
	 The UI interactions will be handled by the command decorator.
	 Using this mechanism a command is not dependent on the context in which it is used.
	"
	| contact |
	(LtRequest command: self)
		title: 'Create new contact';
		request: 'Enter new contact name and phone (split by comma)';
		whenAnsweredBlock: [ :command :answer |
			|splitted|
			splitted := answer splitOn: $,.
			command contactName: splitted first.
			command contactPhone: splitted second ];
		signal.
	
	contact := LtContact named: self contactName phone: self contactPhone.
	self hasSelectedContact
		ifTrue: [ self contactBook addContact: contact after: self selectedContact ]
		ifFalse: [ self contactBook addContact: contact ].
		
	self contactBookPresenter updateView
]

{ #category : #initialization }
LtAddContactCommand >> initialize [
	super initialize.
	self
		basicName: 'New contact' "This is the name of the command that will be shown to user."
]
