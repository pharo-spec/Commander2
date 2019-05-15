"
I am a concrete visitor that revursively collect all the commands of a commands register.
"
Class {
	#name : #CmCommandsCollector,
	#superclass : #CmVisitor,
	#instVars : [
		'commandsCollected'
	],
	#category : #'Lieutenant-Visitors'
}

{ #category : #accessing }
CmCommandsCollector >> commandsCollected [
	^ commandsCollected
]

{ #category : #initialization }
CmCommandsCollector >> initialize [
	super initialize.
	commandsCollected := OrderedCollection new
]

{ #category : #visiting }
CmCommandsCollector >> visitLtCommand: aLtCommand [
	commandsCollected add: aLtCommand.
	^ aLtCommand
]
