Class {
	#name : #LtCommandsGroup,
	#superclass : #LtAbstractCommandsGroup,
	#traits : 'LtTWithBasicNameAndDescription',
	#classTraits : 'LtTWithBasicNameAndDescription classTrait',
	#instVars : [
		'entries'
	],
	#category : #'Lieutenant-Groups'
}

{ #category : #accessing }
LtCommandsGroup class >> defaultName [
	^ 'Unnamed register'
]

{ #category : #'instance creation' }
LtCommandsGroup class >> named: aString [
	^ self new
		basicName: aString;
		yourself
]

{ #category : #'public-api' }
LtCommandsGroup >> / aString [
	"Alias for #commandOrRegisterNamed:."
	^ self commandOrGroupNamed: aString
]

{ #category : #visiting }
LtCommandsGroup >> acceptVisitor: aLtCommandsRegisterVisitor [
	^ aLtCommandsRegisterVisitor visitLtCommandsGroup: self
]

{ #category : #accessing }
LtCommandsGroup >> allCommands [
	| visitor |
	visitor := LtCommandsCollector new.
	self acceptVisitor: visitor.
	^ visitor commandsCollected
]

{ #category : #'private - utilities' }
LtCommandsGroup >> buildSpecMenuOn: aMenuBuilder [
	self flag: #TODO. "Should be moved in a visitor."
	self flag: #TODO. "Can not set the icon in menu because of shitty API of Morphic menu stuff..."
	"categoryToCommandsDict
		at: #root
		ifPresent: [ :commands | 
			commands
				do: [ :commandClassToContextBlock | 
					|command|
					command := commandClassToContextBlock key.
					aMenuBuilder
						add: command name target: [ command runWith: commandClassToContextBlock value value ] selector: #value ] ].

	((categoryToCommandsDict associations
		reject: [ :assoc | assoc key = #root ])
		sort: [ :a :b | a key < b key ])
		do: [ :assoc | 
			| subMenu |
			subMenu := MenuMorph new.
			assoc value
				do: [ :commandClassToContextBlock | 
					|command|
					command := commandClassToContextBlock key asSpecCommand.
					subMenu
						add: command name target: [ command runWith: commandClassToContextBlock value value ] selector: #value ].
			aMenuBuilder
				add: assoc key asCamelCase
				subMenu: subMenu ]"
]

{ #category : #'public-api' }
LtCommandsGroup >> commandOrGroupNamed: aString [
	^ (entries detect: [ :commandOrRegister | commandOrRegister basicName = aString ])
]

{ #category : #'public-api' }
LtCommandsGroup >> commands [
	^ entries select: [ :entry | entry isCommand ]
]

{ #category : #'public-api' }
LtCommandsGroup >> entries [
	^ entries
]

{ #category : #'public-api' }
LtCommandsGroup >> groups [
	^ entries select: [ :entry | entry isGroup ]
]

{ #category : #testing }
LtCommandsGroup >> hasCommand: aLtCommand [
	^ self commands includes: aLtCommand
]

{ #category : #testing }
LtCommandsGroup >> hasEntryNamed: aString [
	"Returns true if one of my entries (command, registry, ...) is named aString.
	 Else returns false.
	"
	^ entries anySatisfy: [ :any | any basicName = aString ]
]

{ #category : #initialization }
LtCommandsGroup >> initialize [
	super initialize.
	self basicName: self class defaultName.
	entries := OrderedCollection new
]

{ #category : #'public-api' }
LtCommandsGroup >> register: aLtCommandsOrRegister [
	(self hasEntryNamed: aLtCommandsOrRegister basicName)
		ifTrue: [ LtDuplicatedEntryName signalEntryNamed: aLtCommandsOrRegister basicName ].
	
	entries add: aLtCommandsOrRegister
]

{ #category : #'public-api' }
LtCommandsGroup >> unregister: aLtCommandOrRegister [
	entries remove: (entries detect: [ :e | e = aLtCommandOrRegister ])
]
