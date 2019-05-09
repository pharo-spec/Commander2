Extension { #name : #EpLogBrowserPresenter }

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> buildCommandsGroupWith: presenter forRoot: aLtCommandsGroup [
	aLtCommandsGroup
		register: (self codeChangesGroupWith: presenter);
		register: (self eventsGroupWith: presenter);
		register: (self refactoringGroupWith: presenter)
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> codeChangesGroupWith: presenter [
	"Lieutenant version of inst-side #codeChangesMenuActions"
	^ (LtCommandsGroup named: 'Code changes') asSpecGroup
		register: (EpOpenPreviewToApplySelectedChanges forSpec context: presenter);
		register: (EpOpenPreviewToRevertSelectedChanges forSpec context: presenter);
		register: (EpBrowseSelection forSpec context: presenter);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> eventsGroupWith: presenter [
	"Lieutenant version of inst-side #eventMenuActions"
	^ (LtCommandsGroup named: 'Event') asSpecGroup
		register: (EpCommentSelection forSpec context: presenter);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> myCustomCommandsWith: presenter forRoot: rootGroup [
	<lieutenantExtension>
	(rootGroup / 'Event')
		register: ((LtCommandsGroup named: 'Custom') asSpecGroup
						register: (LtInspectCommand forSpec context: presenter);
						yourself)
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> refactoringGroupWith: presenter [
	"Lieutenant version of inst-side #refactoringMenuActions"
	^ (LtCommandsGroup named: 'Refactoring') asSpecGroup
		register: (EpApplyCompleteRefactoringInSelection forSpec context: self);
		register: (EpApplyPropagateRefactoringInSelection forSpec context: self);
		yourself
]
