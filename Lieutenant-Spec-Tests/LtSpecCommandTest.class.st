Class {
	#name : #LtSpecCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'Lieutenant-Spec-Tests'
}

{ #category : #running }
LtSpecCommandTest >> setUp [
	super setUp.
	command := LtSpecCommand new
]

{ #category : #test }
LtSpecCommandTest >> testHasShortcut [
	self deny: command hasShortcut.
	
	command shortcutKey: $a asKeyCombination.
	
	self assert: command hasShortcut.
]

{ #category : #test }
LtSpecCommandTest >> testIcon [
	self assert: command icon equals: (command iconNamed: command class defaultIconName).
	
	command iconName: #add.
	
	self assert: command icon equals: (command iconNamed: #add).
]

{ #category : #test }
LtSpecCommandTest >> testIconName [
	self assert: command iconName equals: command class defaultIconName.
	
	command iconName: #add.
	
	self assert: command iconName equals: #add
	
	
]

{ #category : #test }
LtSpecCommandTest >> testShortcutKey [
	self should: [ command shortcutKey ] raise: LtNoShortcutIsDefined.
	
	command shortcutKey: $a asKeyCombination.
	
	self assert: command shortcutKey equals:  $a asKeyCombination
]
