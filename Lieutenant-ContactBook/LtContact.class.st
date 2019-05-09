Class {
	#name : #LtContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'phone'
	],
	#category : #'Lieutenant-ContactBook-Model'
}

{ #category : #'instance creation' }
LtContact class >> named: aString phone: phone [
	^self new 
		name: aString;
		phone: phone
]

{ #category : #accessing }
LtContact >> name [
	^ name
]

{ #category : #accessing }
LtContact >> name: anObject [
	name := anObject
]

{ #category : #accessing }
LtContact >> phone [
	^ phone
]

{ #category : #accessing }
LtContact >> phone: anObject [
	phone := anObject
]

{ #category : #printing }
LtContact >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	aStream nextPutAll: name.
	aStream nextPut: $).
]
