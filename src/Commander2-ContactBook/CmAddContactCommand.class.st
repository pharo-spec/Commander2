"
I am a command allowing to add a contact.
"
Class {
	#name : #CmAddContactCommand,
	#superclass : #CmContactBookCommand,
	#category : #'Commander2-ContactBook-Commands'
}

{ #category : #converting }
CmAddContactCommand >> asSpecCommand [
	"Here we define the additional information that the command will need to know
	 when used in Spec framework.
	"
	^ super asSpecCommand
		shortcutKey: $n meta;
		yourself
]

{ #category : #hooks }
CmAddContactCommand >> execute [
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
CmAddContactCommand >> initialize [
	super initialize.
	self
		basicName: 'New contact'; "This is the name of the command that will be shown to user."
		basicDescription: 'Creates a new contact and add it to the contact book.' "This is the description of the command that will be shown to user."
]
