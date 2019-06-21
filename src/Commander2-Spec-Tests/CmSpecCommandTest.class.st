Class {
	#name : #CmSpecCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'Commander2-Spec-Tests'
}

{ #category : #helpers }
CmSpecCommandTest >> banana [
	"Does not return an icon, it is not needed for the test."
	^ 42
]

{ #category : #helpers }
CmSpecCommandTest >> iconNamed: aSymbol [
	aSymbol ~= #banana
		ifTrue: [ self error: 'Only #banana icon is needed for tests.' ].
		
	^ self banana
]

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
	self assert: command icon isNil.
	
	command iconName: #add.
	
	self assert: command icon equals: (command iconNamed: #add).
]

{ #category : #test }
CmSpecCommandTest >> testIconName [
	self assert: command iconName isNil.
	
	command iconName: #add.
	
	self assert: command iconName equals: #add
	
	
]

{ #category : #test }
CmSpecCommandTest >> testIconNameFrom [
	self assert: command iconProvider equals: Smalltalk ui icons.
	
	command iconName: #banana from: self.
	
	self assert: command iconProvider equals: self.
	self assert: (command icon) equals: self banana
]

{ #category : #test }
CmSpecCommandTest >> testIconProvider [
	self assert: command iconProvider equals: Smalltalk ui icons.
	
	command iconProvider: self.
	
	self assert: command iconProvider equals: self.
	
	command iconName: #banana.
	self assert: (command icon) equals: self banana
]

{ #category : #test }
CmSpecCommandTest >> testShortcutKey [
	self should: [ command shortcutKey ] raise: CmNoShortcutIsDefined.
	
	command shortcutKey: $a asKeyCombination.
	
	self assert: command shortcutKey equals:  $a asKeyCombination
]
