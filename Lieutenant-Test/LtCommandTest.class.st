Class {
	#name : #LtCommandTest,
	#superclass : #TestCase,
	#category : #'Lieutenant-Test'
}

{ #category : #tests }
LtCommandTest >> testOpenDefaultValue [

	| command |
	command := LtOpenCommandForTest new.
	self assert: command name equals: 'Open'.
	self assert: command iconName equals: #error.
	self assert: command shortcutKey equals: 'O'.
]
