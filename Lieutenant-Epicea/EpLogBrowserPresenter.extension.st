Extension { #name : #EpLogBrowserPresenter }

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> buildCommandsGroupWith: presenter forRoot: aLtCommandsGroup [
	aLtCommandsGroup
		register: (self codeChangesGroupWith: presenter) beDisplayedAsGroup;
		register: (self eventsGroupWith: presenter) beDisplayedAsGroup;
		register: (self refactoringGroupWith: presenter) beDisplayedAsGroup;
		register: (self filtersGoupWith: presenter) beDisplayedAsSubMenu;
		register: (self fileOutGroupWith: presenter) beDisplayedAsGroup
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> cleanFiltersGroupWith: presenter [
	^ (LtCommandsGroup named: 'Clean filters') asSpecGroup
		register: (EpCleanFilters forSpec context: presenter);
		yourself
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
EpLogBrowserPresenter class >> dependingOnEntityFiltersGroupWith: presenter [
	^ (LtCommandsGroup named: 'Entity filters') asSpecGroup
		register: (EpEntryReferencesFilterCommand forSpec context: presenter);
		register: (EpShowOnlyChangesToThisMethod forSpec context: presenter);
		register: (EpShowOnlyChangesToThisClassOrTrait forSpec context: presenter);
		register: (EpShowOnlyChangesToThisPackage forSpec context: presenter);
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
EpLogBrowserPresenter class >> fileOutGroupWith: presenter [
	"Lieutenant version of inst-side #codeChangesMenuActions"
	^ (LtCommandsGroup named: 'FileOut') asSpecGroup
		register: (EpFileOutSelection forSpec context: presenter);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> filtersGoupWith: presenter [
	^ (LtCommandsGroup named: 'Filters') asSpecGroup
		register: (self cleanFiltersGroupWith: presenter) beDisplayedAsGroup;
		register: (self latestAndImpactCodeFiltersGroupWith: presenter) beDisplayedAsGroup;
		register: (self dependingOnEntityFiltersGroupWith: presenter) beDisplayedAsGroup;
		register: (self timeFiltersGroupWith: presenter) beDisplayedAsGroup;
		register: (self pluggableFiltersGroupWith: presenter) beDisplayedAsGroup;
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> latestAndImpactCodeFiltersGroupWith: presenter [
	^ (LtCommandsGroup named: 'Code filters') asSpecGroup
		register: (EpLatestCodeChangeFilterCommand forSpec context: presenter);
		register: (EpImpactCodeChangeFilterCommand forSpec context: presenter);
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
EpLogBrowserPresenter class >> pluggableFiltersGroupWith: presenter [
	| group |
	group := (LtCommandsGroup named: 'Pluggable filters') asSpecGroup.
	
	EpPluggableFilter allFilters do: [ :aFilter |
		group register: (EpPluggableFilterCommand pluggableFilter: aFilter) asSpecCommand ].
	
	^ group
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> refactoringGroupWith: presenter [
	"Lieutenant version of inst-side #refactoringMenuActions"
	^ (LtCommandsGroup named: 'Refactoring') asSpecGroup
		register: (EpApplyCompleteRefactoringInSelection forSpec context: self);
		register: (EpApplyPropagateRefactoringInSelection forSpec context: self);
		yourself
]

{ #category : #'*Lieutenant-Epicea' }
EpLogBrowserPresenter class >> timeFiltersGroupWith: presenter [
	^ (LtCommandsGroup named: 'Time filters') asSpecGroup
		register: (EpShowOnlyIfDoneToday forSpec context: presenter);
		register: (EpHideEventsDoneAfter forSpec context: presenter);
		register: (EpHideEventsDoneBefore forSpec context: presenter);
		yourself
]
