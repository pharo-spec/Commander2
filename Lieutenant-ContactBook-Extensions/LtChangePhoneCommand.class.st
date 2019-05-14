Class {
	#name : #LtChangePhoneCommand,
	#superclass : #LtContactBookCommand,
	#instVars : [
		'newPhone'
	],
	#category : #'Lieutenant-ContactBook-Extensions'
}

{ #category : #hooks }
LtChangePhoneCommand >> execute [
	"One should never manipulate UI directly from a commande.
	 Instead, you can use one of the subclass of LtCommandNotification.
	 The UI interactions will be handled by the command decorator.
	 Using this mechanism a command is not dependent on the context in which it is used.
	"
	self selectedContact phone: self context newPhone.
	self contactBookPresenter updateView
]

{ #category : #initialization }
LtChangePhoneCommand >> initialize [
	super initialize.
	self
		basicName: 'Change phone';
		basicDescription: 'Change the phone number of the contact.'
]

{ #category : #accessing }
LtChangePhoneCommand >> newPhone [
	^ newPhone
]

{ #category : #accessing }
LtChangePhoneCommand >> newPhone: anObject [
	newPhone := anObject
]
