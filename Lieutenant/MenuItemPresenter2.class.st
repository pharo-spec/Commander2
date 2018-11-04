"
to see if we could have menu whose logic is defined by a  command.
"
Class {
	#name : #MenuItemPresenter2,
	#superclass : #MenuItemPresenter,
	#instVars : [
		'command'
	],
	#category : #Lieutenant
}

{ #category : #api }
MenuItemPresenter2 >> name [ 
	^ command 
		ifNil: [ name value "could be super shortcut" ] 
		ifNotNil: [ command name ]
]

{ #category : #api }
MenuItemPresenter2 >> shortcut [ 
	^ command 
		ifNil: [ shortcut value "could be super shortcut" ] 
		ifNotNil: [ command shortcut ]
]
