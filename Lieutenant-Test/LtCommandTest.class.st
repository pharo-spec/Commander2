Class {
	#name : #LtCommandTest,
	#superclass : #TestCase,
	#category : #'Lieutenant-Test'
}

{ #category : #tests }
LtCommandTest >> testIconValueOfCommandWithIcon [

	| commandWithIcon |
	commandWithIcon := LtOpenCommandForTest new.
	self assert: commandWithIcon iconName equals: #error.
 	self assert: commandWithIcon hasIcon.
	self assert: commandWithIcon icon class equals: Form.
	
	"now we can even change the icon name"
	commandWithIcon iconName: #pharo.
	self assert: commandWithIcon iconName equals: #pharo.
	self assert: commandWithIcon icon class equals: Form.
]

{ #category : #tests }
LtCommandTest >> testIconValueOfCommandWithNoIcon [

	| commandWithIcon |
	commandWithIcon := LtNoIconCommandForTest new.
	self deny: commandWithIcon hasIcon.
	self assert: commandWithIcon iconName equals: nil.
 	
	self should: [ commandWithIcon icon ] raise: MessageNotUnderstood
]

{ #category : #tests }
LtCommandTest >> testNoIconValueOfCommandWithIcon [

	| commandWithIcon |
	commandWithIcon := LtOpenCommandForTest new.
	commandWithIcon noIcon.
	self deny: commandWithIcon hasIcon.
	
	self assert: commandWithIcon iconName equals: nil.
 	self should: [commandWithIcon icon] raise: MessageNotUnderstood 
]

{ #category : #tests }
LtCommandTest >> testOpenSimpleDefaultValues [

	| command |
	command := LtOpenCommandForTest new.
	self assert: command name equals: 'Open'.
	self assert: command iconName equals: #error.
	self assert: command shortcutKey equals: 'O'.
 
]
