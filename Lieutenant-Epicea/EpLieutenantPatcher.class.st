"
I patch EpiceaLogBrowserPresenter to use lieutenant commands.
"
Class {
	#name : #EpLieutenantPatcher,
	#superclass : #Object,
	#category : #'Lieutenant-Epicea'
}

{ #category : #accessing }
EpLieutenantPatcher class >> patch [
	<script>
	EpLogBrowserPresenter compile: 'initializeItemsPresenter
	self itemsPresenter
		beMultipleSelection;
		"		autoDeselect: true; -> not implemented yet?"
		displayBlock: [ :entryReference | self morphForItemAt: entryReference ];
		whenSelectionChangedDo: [ self refreshEntryContentModelDeferrer schedule ];
		menu: [ self rootCommandsGroup asMenuPresenter ]'.
		
	EpLogBrowserToolbarPresenter compile: 'filtersAction

	(self logBrowserPresenter rootCommandsGroup / ''Filters'')
		asMenuPresenter openWithSpecAt: ActiveHand position'
]
