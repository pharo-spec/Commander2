Class {
	#name : #LtRenameContactCommand,
	#superclass : #Object,
	#instVars : [
		'contact',
		'newName'
	],
	#category : #'Lieutenant-Example'
}

{ #category : #'instance creation' }
LtRenameContactCommand class >> contact: aContact to: newNameString [
        ^self new
            contact: aContact;
            newName: newNameString;
            yourself
]

{ #category : #accessing }
LtRenameContactCommand >> contact [
	^ contact
]

{ #category : #accessing }
LtRenameContactCommand >> contact: anObject [
	contact := anObject
]

{ #category : #execution }
LtRenameContactCommand >> execute [
        contact name: newName
]

{ #category : #accessing }
LtRenameContactCommand >> newName [
	^ newName
]

{ #category : #accessing }
LtRenameContactCommand >> newName: anObject [
	newName := anObject
]
