"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpEntryReferencesFilterCommand,
	#superclass : #EpFilterCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #hooks }
EpEntryReferencesFilterCommand >> execute [
	"The context here is the EpLogBrowserPresenter.
	 In fact, the design of these filters should be changed to move code in EpLogBrowserPresenter's method called to the filter."
	self context filterSelection
]

{ #category : #initialization }
EpEntryReferencesFilterCommand >> initialize [
	super initialize.
	self filterClass: EpEntryReferencesFilter
]
