Class {
	#name : #LtSimpleRenameContactCommand,
	#superclass : #Object,
	#instVars : [
		'contact',
		'newName'
	],
	#category : #'Lieutenant-Tests'
}

{ #category : #'instance creation' }
LtSimpleRenameContactCommand class >> contact: aContact to: newNameString [
        ^self new
            contact: aContact;
            newName: newNameString;
            yourself
]

{ #category : #accessing }
LtSimpleRenameContactCommand >> contact [
	^ contact
]

{ #category : #accessing }
LtSimpleRenameContactCommand >> contact: anObject [
	contact := anObject
]

{ #category : #execution }
LtSimpleRenameContactCommand >> execute [
	contact basicName: newName
]

{ #category : #accessing }
LtSimpleRenameContactCommand >> newName [
	^ newName
]

{ #category : #accessing }
LtSimpleRenameContactCommand >> newName: anObject [
	newName := anObject
]
