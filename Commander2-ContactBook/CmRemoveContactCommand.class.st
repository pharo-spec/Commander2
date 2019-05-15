"
I am a command allowing to remove a contact.
"
Class {
	#name : #CmRemoveContactCommand,
	#superclass : #CmContactBookCommand,
	#category : #'Commander2-ContactBook-Commands'
}

{ #category : #converting }
CmRemoveContactCommand >> asSpecCommand [
	"Here we define the additional information that the command will need to know
	 when used in Spec framework.
	"
	^ super asSpecCommand
		iconName: #removeIcon;
		shortcutKey: KMModifier meta + $x asKeyCombination;
		yourself
]

{ #category : #hooks }
CmRemoveContactCommand >> canBeRun [
	^ self context isContactSelected
]

{ #category : #hooks }
CmRemoveContactCommand >> execute [
	self contactBookPresenter removeContact: self selectedContact.
	self contactBookPresenter updateView
]

{ #category : #initialization }
CmRemoveContactCommand >> initialize [
	super initialize.
	self
		basicName: 'Remove'; "This is the name of the command that will be shown to user."
		basicDescription: 'Removes the selected contact from the contact book.' "This is the description of the command that will be shown to user."
]
