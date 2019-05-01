Extension { #name : #EpLogBrowserPresenter }

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> eventsRegister [
	"Lieutenant version of #eventMenuActions."
	^ (LtCommandsRegister named: 'Event')
		registerCommand: EpCommentSelection forSpec withContext: self;
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter >> refactoringRegister [
	"Lieutenant version of #refactoringMenuActions"
	^ (LtCommandsRegister named: 'Refactoring')
		registerCommand: EpApplyCompleteRefactoringInSelection forSpec withContext: self;
		registerCommand: EpApplyPropagateRefactoringInSelection forSpec withContext: self;
		yourself
]
