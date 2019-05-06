"
to see if we could have menu whose logic is defined by a  command.
"
Class {
	#name : #MenuItemPresenter2,
	#superclass : #MenuItemPresenter,
	#instVars : [
		'command'
	],
	#category : #'Lieutenant-Example'
}

{ #category : #api }
MenuItemPresenter2 >> basicName [ 
	^ command 
		ifNil: [ name value "could be super shortcut" ] 
		ifNotNil: [ command basicName ]
]

{ #category : #api }
MenuItemPresenter2 >> shortcut [ 
	^ command 
		ifNil: [ shortcut value "could be super shortcut" ] 
		ifNotNil: [ command shortcut ]
]
