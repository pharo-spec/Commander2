Extension { #name : #EpLogBrowserPresenter }

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> codeChangesGroup [
	"Lieutenant version of #codeChangesMenuActions"
	^ (LtCommandsGroup named: 'Code changes') asSpecGroup
		register: (EpOpenPreviewToApplySelectedChanges forSpec context: self);
		register: (EpOpenPreviewToRevertSelectedChanges forSpec context: self);
		register: (EpBrowseSelection forSpec context: self);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> eventsGroup [
	"Lieutenant version of #eventMenuActions."
	^ (LtCommandsGroup named: 'Event') asSpecGroup
		register: (EpCommentSelection forSpec context: self);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> refactoringGroup [
	"Lieutenant version of #refactoringMenuActions"
	^ (LtCommandsGroup named: 'Refactoring') asSpecGroup
		register: (EpApplyCompleteRefactoringInSelection forSpec context: self);
		register: (EpApplyPropagateRefactoringInSelection forSpec context: self);
		yourself
]
