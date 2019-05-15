"
I am a contact book. I hold a list of contacts.
"
Class {
	#name : #LtContactBook,
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
LtContactBook class >> coworkers [
	^coworkers ifNil: [ 
		coworkers := self new 
			add: 'Stef' phone: '112 378';
			add: 'Pavel' phone: '898 678';
			add: 'Marcus' phone: '444 888';
			yourself]
]

{ #category : #accessing }
LtContactBook class >> family [
	^family ifNil: [ 
		family := self new 
			add: 'John' phone: '342 345';
			add: 'Bill' phone: '123 678';
			add: 'Marry' phone: '789 567';
			yourself]
]

{ #category : #accessing }
LtContactBook class >> reset [
	<script>
	coworkers := nil.
	family := nil
]

{ #category : #accessing }
LtContactBook >> add: contactName phone: phone [
	| contact |
	contact := LtContact named: contactName phone: phone.
	self addContact: contact.
	^contact
]

{ #category : #accessing }
LtContactBook >> addContact: aContact [
	contents add: aContact
]

{ #category : #accessing }
LtContactBook >> addContact: newContact after: contactAfter [ 
	contents add: newContact after: contactAfter
]

{ #category : #accessing }
LtContactBook >> contents [
	^ contents
]

{ #category : #accessing }
LtContactBook >> contents: anObject [
	contents := anObject
]

{ #category : #testing }
LtContactBook >> includesContact: aContact [
	^ contents includes: aContact
	
]

{ #category : #initialization }
LtContactBook >> initialize [
	super initialize.
	contents := OrderedCollection new.
]

{ #category : #accessing }
LtContactBook >> removeContact: aContact [
	contents remove: aContact
]
