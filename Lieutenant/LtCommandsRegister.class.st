Class {
	#name : #LtCommandsRegister,
	#superclass : #Object,
	#instVars : [
		'name',
		'entries'
	],
	#category : #'Lieutenant-Register'
}

{ #category : #accessing }
LtCommandsRegister class >> defaultName [
	^ 'Unnamed register'
]

{ #category : #'instance creation' }
LtCommandsRegister class >> named: aString [
	^ self new
		basicName: aString;
		yourself
]

{ #category : #'public-api' }
LtCommandsRegister >> / aString [
	"Alias for #commandOrRegisterNamed:."
	^ self commandOrRegisterNamed: aString
]

{ #category : #visiting }
LtCommandsRegister >> acceptVisitor: aLtCommandsRegisterVisitor [
	^ aLtCommandsRegisterVisitor visitLtCommandsRegister: self
]

{ #category : #accessing }
LtCommandsRegister >> allCommands [
	| visitor |
	visitor := LtCommandsCollector new.
	self acceptVisitor: visitor.
	^ visitor commandsCollected
]

{ #category : #accessing }
LtCommandsRegister >> basicName [
	^ name
]

{ #category : #accessing }
LtCommandsRegister >> basicName: aString [
	name := aString
]

{ #category : #'private - utilities' }
LtCommandsRegister >> buildSpecMenuOn: aMenuBuilder [
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
LtCommandsRegister >> commandOrRegisterNamed: aString [
	^ (entries detect: [ :commandOrRegister | commandOrRegister basicName = aString ])
]

{ #category : #'public-api' }
LtCommandsRegister >> commands [
	^ entries select: [ :entry | entry isCommand ]
]

{ #category : #'public-api' }
LtCommandsRegister >> entries [
	^ entries
]

{ #category : #testing }
LtCommandsRegister >> hasCommand: aLtCommand [
	^ self commands includes: aLtCommand
]

{ #category : #testing }
LtCommandsRegister >> hasEntryNamed: aString [
	"Returns true if one of my entries (command, registry, ...) is named aString.
	 Else returns false.
	"
	^ entries anySatisfy: [ :any | any basicName = aString ]
]

{ #category : #initialization }
LtCommandsRegister >> initialize [
	super initialize.
	self basicName: self class defaultName.
	entries := OrderedCollection new
]

{ #category : #testing }
LtCommandsRegister >> isCommand [
	^ false
]

{ #category : #testing }
LtCommandsRegister >> isRegister [
	^ true
]

{ #category : #'public-api' }
LtCommandsRegister >> register: aLtCommandsOrRegister [
	(self hasEntryNamed: aLtCommandsOrRegister basicName)
		ifTrue: [ LtDuplicatedEntryName signalEntryNamed: aLtCommandsOrRegister basicName ].
	
	entries add: aLtCommandsOrRegister
]

{ #category : #'public-api' }
LtCommandsRegister >> registry [
	^ entries select: [ :entry | entry isRegister ]
]

{ #category : #'public-api' }
LtCommandsRegister >> unregister: aLtCommandOrRegister [
	entries remove: (entries detect: [ :e | e = aLtCommandOrRegister ])
]
