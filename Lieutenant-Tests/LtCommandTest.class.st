Class {
	#name : #LtCommandTest,
	#superclass : #TestCase,
	#category : #'Lieutenant-Tests'
}

{ #category : #tests }
LtCommandTest >> testIconValueOfCommandWithIcon [

	| commandWithIcon |
	commandWithIcon := LtOpenCommandForTest new asSpecCommand.
	self assert: commandWithIcon iconName equals: #blank.
	self assert: commandWithIcon icon class equals: Form.
	
	"now we can even change the icon name"
	commandWithIcon iconName: #pharo.
	self assert: commandWithIcon iconName equals: #pharo.
	self assert: commandWithIcon icon class equals: Form.
]

{ #category : #tests }
LtCommandTest >> testIconValueOfCommandWithNoIcon [

	| commandWithoutIcon |
	commandWithoutIcon := LtNoIconCommandForTest new asSpecCommand.
	self assert: commandWithoutIcon iconName equals: #blank.
]

{ #category : #tests }
LtCommandTest >> testOpenSimpleDefaultValues [

	| command |
	command := LtOpenCommandForTest new asSpecCommandWithIconNamed: #error shortcutKey: 'O' asKeyCombination.
	self assert: command basicName equals: 'Open'.
	self assert: command iconName equals: #error.
	self assert: command shortcutKey equals: 'O' asKeyCombination.
	self assert: (command canBeRunOn: Object new).
 
]
