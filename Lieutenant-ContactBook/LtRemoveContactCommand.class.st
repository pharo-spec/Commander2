Class {
	#name : #LtRemoveContactCommand,
	#superclass : #LtContactBookCommand,
	#category : #'Lieutenant-ContactBook-Commands'
}

{ #category : #converting }
LtRemoveContactCommand >> asSpecCommand [
	"Here we define the additional information that the command will need to know
	 when used in Spec framework.
	"
	^ super asSpecCommand
		iconName: #removeIcon;
		yourself
]

{ #category : #hooks }
LtRemoveContactCommand >> execute [
	self contactBook removeContact: self selectedContact.
	self contactBookPresenter updateView
]

{ #category : #initialization }
LtRemoveContactCommand >> initialize [
	super initialize.
	self
		basicName: 'Remove' "This is the name of the command that will be shown to user."
]
