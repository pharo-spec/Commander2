"
I model a contact, I have a name and a phone.
"
Class {
	#name : #CmContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'phone'
	],
	#category : #'Lieutenant-ContactBook-Model'
}

{ #category : #'instance creation' }
CmContact class >> named: aString phone: phone [
	^self new 
		name: aString;
		phone: phone
]

{ #category : #accessing }
CmContact >> name [
	^ name
]

{ #category : #accessing }
CmContact >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CmContact >> phone [
	^ phone
]

{ #category : #accessing }
CmContact >> phone: anObject [
	phone := anObject
]

{ #category : #printing }
CmContact >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	aStream nextPutAll: name.
	aStream nextPut: $).
]
