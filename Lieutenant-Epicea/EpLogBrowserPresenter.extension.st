Extension { #name : #EpLogBrowserPresenter }

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> codeChangesRegister [
	"Lieutenant version of #codeChangesMenuActions"
	^ LtCommandsGroup new
		registerCommand: EpOpenPreviewToApplySelectedChanges forSpec withContext: self;
		registerCommand: EpOpenPreviewToRevertSelectedChanges forSpec withContext: self;
		registerCommand: EpBrowseSelection forSpec withContext: self;
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> eventsRegister [
	"Lieutenant version of #eventMenuActions."
	^ (LtCommandsGroup named: 'Event')
		registerCommand: EpCommentSelection forSpec withContext: self;
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> refactoringRegister [
	"Lieutenant version of #refactoringMenuActions"
	^ (LtCommandsGroup named: 'Refactoring')
		registerCommand: EpApplyCompleteRefactoringInSelection forSpec withContext: self;
		registerCommand: EpApplyPropagateRefactoringInSelection forSpec withContext: self;
		yourself
]
