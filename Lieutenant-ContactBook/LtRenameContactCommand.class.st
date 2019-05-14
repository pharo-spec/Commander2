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
	self selectedContact name: self context newName.
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
