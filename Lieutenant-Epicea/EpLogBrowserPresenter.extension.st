Extension { #name : #EpLogBrowserPresenter }

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> codeChangesRegister [
	"Lieutenant version of #codeChangesMenuActions"
	^ LtCommandsGroup forSpec
		register: (EpOpenPreviewToApplySelectedChanges forSpec context: self);
		register: (EpOpenPreviewToRevertSelectedChanges forSpec context: self);
		register: (EpBrowseSelection forSpec context: self);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> eventsRegister [
	"Lieutenant version of #eventMenuActions."
	^ (LtCommandsGroup named: 'Event')
		register: (EpCommentSelection forSpec context: self);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> refactoringRegister [
	"Lieutenant version of #refactoringMenuActions"
	^ (LtCommandsGroup named: 'Refactoring')
		register: (EpApplyCompleteRefactoringInSelection forSpec context: self);
		register: (EpApplyPropagateRefactoringInSelection forSpec context: self);
		yourself
]
