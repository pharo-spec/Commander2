"
I am a contact book. I hold a list of contacts.
"
Class {
	#name : #CmContactBook,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#classInstVars : [
		'family',
		'coworkers'
	],
	#category : #'Lieutenant-ContactBook-Model'
}

{ #category : #accessing }
CmContactBook class >> coworkers [
	^coworkers ifNil: [ 
		coworkers := self new 
			add: 'Stef' phone: '112 378';
			add: 'Pavel' phone: '898 678';
			add: 'Marcus' phone: '444 888';
			yourself]
]

{ #category : #accessing }
CmContactBook class >> family [
	^family ifNil: [ 
		family := self new 
			add: 'John' phone: '342 345';
			add: 'Bill' phone: '123 678';
			add: 'Marry' phone: '789 567';
			yourself]
]

{ #category : #accessing }
CmContactBook class >> reset [
	<script>
	coworkers := nil.
	family := nil
]

{ #category : #accessing }
CmContactBook >> add: contactName phone: phone [
	| contact |
	contact := CmContact named: contactName phone: phone.
	self addContact: contact.
	^contact
]

{ #category : #accessing }
CmContactBook >> addContact: aContact [
	contents add: aContact
]

{ #category : #accessing }
CmContactBook >> addContact: newContact after: contactAfter [ 
	contents add: newContact after: contactAfter
]

{ #category : #accessing }
CmContactBook >> contents [
	^ contents
]

{ #category : #accessing }
CmContactBook >> contents: anObject [
	contents := anObject
]

{ #category : #testing }
CmContactBook >> includesContact: aContact [
	^ contents includes: aContact
	
]

{ #category : #initialization }
CmContactBook >> initialize [
	super initialize.
	contents := OrderedCollection new.
]

{ #category : #accessing }
CmContactBook >> removeContact: aContact [
	contents remove: aContact
]
