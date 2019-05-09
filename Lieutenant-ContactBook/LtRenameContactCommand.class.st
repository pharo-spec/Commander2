Class {
	#name : #LtRenameContactCommand,
	#superclass : #LtContactBookCommand,
	#instVars : [
		'newName'
	],
	#category : #'Lieutenant-ContactBook-Commands'
}

{ #category : #hooks }
LtRenameContactCommand >> execute [
	"One should never manipulate UI directly from a commande.
	 Instead, you can use one of the subclass of LtCommandNotification.
	 The UI interactions will be handled by the command decorator.
	 Using this mechanism a command is not dependent on the context in which it is used.
	"
	(LtRequest command: self)
		title: 'Rename a contact';
		request: 'New name of the contact';
		initialAnswer: self selectedContact name;
		whenAnsweredBlock: [ :command :answer |
			command newName: answer ];
		signal.
	
	self selectedContact name: self newName.
	self contactBookPresenter updateView
]

{ #category : #initialization }
LtRenameContactCommand >> initialize [
	super initialize.
	self
		basicName: 'Rename' "This is the name of the command that will be shown to user."
]

{ #category : #accessing }
LtRenameContactCommand >> newName [
	^ newName
]

{ #category : #accessing }
LtRenameContactCommand >> newName: anObject [
	newName := anObject
]
