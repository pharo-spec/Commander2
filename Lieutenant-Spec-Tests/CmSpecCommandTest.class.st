Class {
	#name : #CmSpecCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'Lieutenant-Spec-Tests'
}

{ #category : #running }
CmSpecCommandTest >> setUp [
	super setUp.
	command := CmSpecCommand new
]

{ #category : #test }
CmSpecCommandTest >> testHasShortcut [
	self deny: command hasShortcut.
	
	command shortcutKey: $a asKeyCombination.
	
	self assert: command hasShortcut.
]

{ #category : #test }
CmSpecCommandTest >> testIcon [
	self assert: command icon equals: (command iconNamed: command class defaultIconName).
	
	command iconName: #add.
	
	self assert: command icon equals: (command iconNamed: #add).
]

{ #category : #test }
CmSpecCommandTest >> testIconName [
	self assert: command iconName equals: command class defaultIconName.
	
	command iconName: #add.
	
	self assert: command iconName equals: #add
	
	
]

{ #category : #test }
CmSpecCommandTest >> testShortcutKey [
	self should: [ command shortcutKey ] raise: CmNoShortcutIsDefined.
	
	command shortcutKey: $a asKeyCombination.
	
	self assert: command shortcutKey equals:  $a asKeyCombination
]
