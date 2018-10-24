Class {
	#name : #LtRenameContactCommandTest,
	#superclass : #TestCase,
	#category : #'Lieutenant-Example'
}

{ #category : #tests }
LtRenameContactCommandTest >> testRenameCommand [

	| contact command |
      contact := Contact new.
      command := LtRenameContactCommand contact: contact to: 'John Smith'.
      command execute.
    self assert: contact name equals: 'John Smith'
]
