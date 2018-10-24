Class {
	#name : #ContactBook,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'Lieutenant-Example'
}

{ #category : #'adding/removing' }
ContactBook >> add: contactName phone: phone [
  | contact |
  contact := Contact named: contactName phone: phone.
  self addContact: contact.
	^ contact
]

{ #category : #'adding/removing' }
ContactBook >> addContact: aContact [
  contents add: aContact
]

{ #category : #'adding/removing' }
ContactBook >> includesContact: aContact [
	^ contents includes: aContact 
]

{ #category : #initialization }
ContactBook >> initialize [
  super initialize.
  contents := OrderedCollection new.
]
