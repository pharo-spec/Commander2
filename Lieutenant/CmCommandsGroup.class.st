Class {
	#name : #CmCommandsGroup,
	#superclass : #CmAbstractCommandsGroup,
	#traits : 'CmTWithBasicNameAndDescription + CmTDecorable',
	#classTraits : 'CmTWithBasicNameAndDescription classTrait + CmTDecorable classTrait',
	#instVars : [
		'entries'
	],
	#category : #'Lieutenant-Groups'
}

{ #category : #default }
CmCommandsGroup class >> defaultDescription [
	^ 'I''m group and I should provide a nice description for my user.'
]

{ #category : #default }
CmCommandsGroup class >> defaultName [
	^ 'Unnamed group'
]

{ #category : #'instance creation' }
CmCommandsGroup class >> forSpec [
	^ self new asSpecGroup
]

{ #category : #'instance creation' }
CmCommandsGroup class >> forSpecWithIconNamed: aSymbol [
	^ self new asSpecGroupWithIconNamed: aSymbol
]

{ #category : #'instance creation' }
CmCommandsGroup class >> named: aString [
	^ self new
		basicName: aString;
		yourself
]

{ #category : #accessing }
CmCommandsGroup >> allCommands [
	| visitor |
	visitor := CmCommandsCollector new.
	self acceptVisitor: visitor.
	^ visitor commandsCollected
]

{ #category : #'public-api' }
CmCommandsGroup >> commandOrGroupNamed: aString [
	^ (entries detect: [ :commandOrRegister | commandOrRegister basicName = aString ])
]

{ #category : #'public-api' }
CmCommandsGroup >> commands [
	^ entries select: [ :entry | entry isCommand ]
]

{ #category : #'public-api' }
CmCommandsGroup >> entries [
	^ entries
]

{ #category : #'public-api' }
CmCommandsGroup >> groups [
	^ entries select: [ :entry | entry isGroup ]
]

{ #category : #testing }
CmCommandsGroup >> hasCommand: aCmCommand [
	^ self commands includes: aCmCommand
]

{ #category : #testing }
CmCommandsGroup >> hasEntryNamed: aString [
	"Returns true if one of my entries (command, registry, ...) is named aString.
	 Else returns false.
	"
	^ entries anySatisfy: [ :any | any basicName = aString ]
]

{ #category : #initialization }
CmCommandsGroup >> initialize [
	super initialize.
	self basicName: self class defaultName.
	self basicDescription: self class defaultDescription.
	entries := OrderedCollection new
]

{ #category : #'public-api' }
CmCommandsGroup >> register: aCmCommandsOrGroup [
	(self hasEntryNamed: aCmCommandsOrGroup basicName)
		ifTrue: [ CmDuplicatedEntryName signalEntryNamed: aCmCommandsOrGroup basicName ].
	
	entries add: aCmCommandsOrGroup
]

{ #category : #'public-api' }
CmCommandsGroup >> register: aCmCommandsOrGroup after: anotherLtCommandsOrGroup [
	self shouldBeImplemented; flag: #TODO
]

{ #category : #'public-api' }
CmCommandsGroup >> register: aCmCommandsOrGroup before: anotherLtCommandsOrGroup [
	self shouldBeImplemented; flag: #TODO
]

{ #category : #'public-api' }
CmCommandsGroup >> register: aCmCommandsOrGroup insteadOf: anotherLtCommandsOrGroup [
	self shouldBeImplemented; flag: #TODO
]

{ #category : #'public-api' }
CmCommandsGroup >> registerFirst: aCmCommandsOrGroup [
	self shouldBeImplemented; flag: #TODO
]

{ #category : #'public-api' }
CmCommandsGroup >> registerLast: aCmCommandsOrGroup [
	self shouldBeImplemented; flag: #TODO
]

{ #category : #'public-api' }
CmCommandsGroup >> unregister: aCmCommandOrGroup [
	entries remove: (entries detect: [ :e | e = aCmCommandOrGroup ])
]
