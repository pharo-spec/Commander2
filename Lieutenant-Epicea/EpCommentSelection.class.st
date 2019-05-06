"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#commentSelection.
Name and description extracted from: EpLogBrowserPresenter>>#eventsMenuActions
"
Class {
	#name : #EpCommentSelection,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #decorating }
EpCommentSelection >> asSpecCommand [
	^ super asSpecCommand
		iconNamed: #announcementIcon;
		shortcutKey: $c command;
		yourself
]

{ #category : #hooks }
EpCommentSelection >> execute [
	| items newCommentOrNil oldComment entryReferences |
	items := self context selectedEntryItems.
	entryReferences := items collect: #reference.
	oldComment := items anyOne oldComment.
		
	newCommentOrNil := UIManager default
		multiLineRequest: 'Enter a comment for the selection' 
		initialAnswer: oldComment
		answerHeight: 250.

	newCommentOrNil ifNil: [ ^ self ].
	
	self context logOffEvent:
		(EpLogEntriesComment 
			entryReferences: entryReferences 
			oldComment: oldComment 
			newComment: newCommentOrNil)
]

{ #category : #initialization }
EpCommentSelection >> initialize [
	super initialize.
	self
		basicName: 'Comment';
		basicDescription: 'Edit comment of selected entries'
]
