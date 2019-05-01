"
I am the error raised when one tries add an entry in registry for which the name already exists.
"
Class {
	#name : #LtDuplicatedEntryName,
	#superclass : #Error,
	#instVars : [
		'entryName'
	],
	#category : #'Lieutenant-Errors'
}

{ #category : #'instance creation' }
LtDuplicatedEntryName class >> forEntryNamed: aString [
	^ self new
		entryName: aString;
		yourself
]

{ #category : #signalling }
LtDuplicatedEntryName class >> signalEntryNamed: aString [
	^ (self forEntryNamed: aString)  signal
]

{ #category : #accessing }
LtDuplicatedEntryName >> entryName [
	^ entryName
]

{ #category : #accessing }
LtDuplicatedEntryName >> entryName: aString [
	entryName := aString
]
