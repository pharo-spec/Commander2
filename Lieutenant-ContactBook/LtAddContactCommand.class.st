Class {
	#name : #LtAddContactCommand,
	#superclass : #LtContactBookCommand,
	#instVars : [
		'contactName',
		'contactPhone'
	],
	#category : #'Lieutenant-ContactBook-Commands'
}

{ #category : #converting }
LtAddContactCommand >> asSpecCommand [
	"Here we define the additional information that the command will need to know
	 when used in Spec framework.
	"
	^ super asSpecCommand
		shortcutKey: KMModifier meta + $n asKeyCombination;
		yourself
]

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
	contact := self context newContact.
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
