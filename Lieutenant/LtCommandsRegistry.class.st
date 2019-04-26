Class {
	#name : #LtCommandsRegistry,
	#superclass : #Object,
	#instVars : [
		'categoryToCommandsDict'
	],
	#category : #Lieutenant
}

{ #category : #accessing }
LtCommandsRegistry >> allCommands [
	^ categoryToCommandsDict values flattened collect: #key
]

{ #category : #'private - utilities' }
LtCommandsRegistry >> buildSpecMenuOn: aMenuBuilder [
	categoryToCommandsDict
		at: #root
		ifPresent: [ :commands | 
			commands
				do: [ :commandClassToContextBlock | 
					|command|
					command := commandClassToContextBlock key new.
					aMenuBuilder
						add: command name target: [ command runWith: commandClassToContextBlock value ] selector: #value ] ].

	((categoryToCommandsDict associations
		reject: [ :assoc | assoc key = #root ])
		sort: [ :a :b | a key < b key ])
		do: [ :assoc | 
			| subMenu |
			subMenu := MenuMorph new.
			assoc value
				do: [ :commandClassToContextBlock | 
					|command|
					command := commandClassToContextBlock key new asSpecCommand.
					subMenu
						add: command name target: [ command runWith: commandClassToContextBlock value ] selector: #value ].
			aMenuBuilder
				add: assoc key asCamelCase
				icon: (self iconNamed: #blank)
				subMenu: subMenu ]
]

{ #category : #accessing }
LtCommandsRegistry >> categoriesToCommands [
	^ categoryToCommandsDict collect: [ :collection | collection collect: #key ]
]

{ #category : #testing }
LtCommandsRegistry >> hasCommand: aLtCommandClass [
	^ self allCommands includes: aLtCommandClass
]

{ #category : #initialization }
LtCommandsRegistry >> initialize [
	super initialize.
	categoryToCommandsDict := Dictionary new.
]

{ #category : #accessing }
LtCommandsRegistry >> registerCommand: aLtCommandClass underCategory: aSymbol withContextBlock: blockToRetrieveContext [
	(self hasCommand: aLtCommandClass)
		ifTrue: [ self error: 'Command already registered.' ].
	
	(categoryToCommandsDict at: aSymbol ifAbsentPut: OrderedCollection new)
		add: (aLtCommandClass -> blockToRetrieveContext)
]

{ #category : #accessing }
LtCommandsRegistry >> unregisterCommand: aLtCommandClass [
	categoryToCommandsDict := categoryToCommandsDict collect: [ :commands |
										commands reject: [ :commandToBlock | commandToBlock key = aLtCommandClass ] ]
]
