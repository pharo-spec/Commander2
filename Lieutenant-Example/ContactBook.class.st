Class {
	#name : #ContactBook,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#classInstVars : [
		'family'
	],
	#category : #'Lieutenant-Example'
}

{ #category : #example }
ContactBook class >> family [
	<sampleInstance>
        ^family ifNil: [
          family := self new
            add: 'John' phone: '342 345';
            add: 'Bill' phone: '123 678';
            add: 'Mary' phone: '789 567';
            yourself ]
]

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

{ #category : #accessing }
ContactBook >> contents [
	^ contents
]

{ #category : #accessing }
ContactBook >> contents: anObject [
	contents := anObject
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
