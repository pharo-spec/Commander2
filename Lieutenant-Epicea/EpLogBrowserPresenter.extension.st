Extension { #name : #EpLogBrowserPresenter }

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> codeChangesGroupOn: presenter [
	"Lieutenant version of inst-side #codeChangesMenuActions"
	<lieutenant>
	^ (LtCommandsGroup named: 'Code changes') asSpecGroup
		register: (EpOpenPreviewToApplySelectedChanges forSpec context: presenter);
		register: (EpOpenPreviewToRevertSelectedChanges forSpec context: presenter);
		register: (EpBrowseSelection forSpec context: presenter);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> eventsGroupOn: presenter [
	"Lieutenant version of inst-side #eventMenuActions"
	<lieutenant>
	^ (LtCommandsGroup named: 'Event') asSpecGroup
		register: (EpCommentSelection forSpec context: presenter);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> refactoringGroupOn: presenter [
	"Lieutenant version of inst-side #refactoringMenuActions"
	<lieutenant>
	^ (LtCommandsGroup named: 'Refactoring') asSpecGroup
		register: (EpApplyCompleteRefactoringInSelection forSpec context: self);
		register: (EpApplyPropagateRefactoringInSelection forSpec context: self);
		yourself
]
