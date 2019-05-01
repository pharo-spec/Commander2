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
		name: aString;
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
	^ (entries detect: [ :commandOrRegister | commandOrRegister name = aString ]) wrappedObject
]

{ #category : #'public-api' }
LtCommandsRegister >> commands [
	^ entries select: [ :entry | entry isCommand ] thenCollect: #command
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
	^ entries anySatisfy: [ :any | any name = aString ]
]

{ #category : #initialization }
LtCommandsRegister >> initialize [
	super initialize.
	self name: self class defaultName.
	entries := OrderedCollection new
]

{ #category : #accessing }
LtCommandsRegister >> name [
	^ name
]

{ #category : #accessing }
LtCommandsRegister >> name: aString [
	name := aString
]

{ #category : #'public-api' }
LtCommandsRegister >> registerCommand: aLtCommand withContext: anObject [
	self registerCommand: aLtCommand withContextBlock: [ anObject ]
]

{ #category : #'public-api' }
LtCommandsRegister >> registerCommand: aLtCommand withContextBlock: aBlock [
	(self hasEntryNamed: aLtCommand name)
		ifTrue: [ LtDuplicatedEntryName signalEntryNamed: aLtCommand name ].
	
	entries add: (LtCommandEntry command: aLtCommand contextBlock: aBlock)
]

{ #category : #'public-api' }
LtCommandsRegister >> registerSubRegister: aLtCommandsRegister [
	(self hasEntryNamed: aLtCommandsRegister name)
		ifTrue: [ LtDuplicatedEntryName signalEntryNamed: aLtCommandsRegister name ].
	
	entries add: (LtRegisterEntry register: aLtCommandsRegister)
]

{ #category : #'public-api' }
LtCommandsRegister >> registry [
	^ entries select: [ :entry | entry isRegister ] thenCollect: #register
]

{ #category : #'public-api' }
LtCommandsRegister >> unregister: aLtCommandOrRegister [
	entries remove: (entries detect: [ :e | e wrappedObject = aLtCommandOrRegister ])
]
