"
I am a concrete visitor that revursively collect all the commands of a commands register.
"
Class {
	#name : #LtCommandsCollector,
	#superclass : #LtCommandsGroupVisitor,
	#instVars : [
		'commandsCollected'
	],
	#category : #'Lieutenant-Register'
}

{ #category : #accessing }
LtCommandsCollector >> commandsCollected [
	^ commandsCollected
]

{ #category : #initialization }
LtCommandsCollector >> initialize [
	super initialize.
	commandsCollected := OrderedCollection new
]

{ #category : #visiting }
LtCommandsCollector >> visitLtCommand: aLtCommand [
	commandsCollected add: aLtCommand.
	^ aLtCommand
]
