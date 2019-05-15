Class {
	#name : #CmChangePhoneCommand,
	#superclass : #CmContactBookCommand,
	#instVars : [
		'newPhone'
	],
	#category : #'Commander2-ContactBook-Extensions'
}

{ #category : #hooks }
CmChangePhoneCommand >> execute [
	"One should never manipulate UI directly from a commande.
	 Instead, you can use one of the subclass of LtCommandNotification.
	 The UI interactions will be handled by the command decorator.
	 Using this mechanism a command is not dependent on the context in which it is used.
	"
	self selectedContact phone: self context newPhone.
	self contactBookPresenter updateView
]

{ #category : #initialization }
CmChangePhoneCommand >> initialize [
	super initialize.
	self
		basicName: 'Change phone';
		basicDescription: 'Change the phone number of the contact.'
]

{ #category : #accessing }
CmChangePhoneCommand >> newPhone [
	^ newPhone
]

{ #category : #accessing }
CmChangePhoneCommand >> newPhone: anObject [
	newPhone := anObject
]
