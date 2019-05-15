"
I patch EpiceaLogBrowserPresenter to use lieutenant commands.
"
Class {
	#name : #EpLieutenantPatcher,
	#superclass : #Object,
	#category : #'Commander2-Epicea'
}

{ #category : #cleaning }
EpLieutenantPatcher class >> cleanMethodsNoLongerRequired [
	"Removes all methods that are now replaced by Lieutenant commands."
	#(#addMenuItemsForSelectedItemsIn: #codeChangesMenuActions #eventsMenuActions #filtersSubMenu #menuActionsForSelectedItems #menuMorphForSelectedItems #refactoringMenuActions) do: [ :selector |
		(EpLogBrowserPresenter >> selector) removeFromSystem ]
]

{ #category : #patching }
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

	(self logBrowserPresenter rootCommandsGroup / ''Filters'') beRoot
		asMenuPresenter openWithSpecAt: ActiveHand position'.
	
]
