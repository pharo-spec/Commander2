"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpLatestCodeChangeFilterCommand,
	#superclass : #EpFilterCommand,
	#category : #'Commander2-Epicea'
}

{ #category : #hooks }
EpLatestCodeChangeFilterCommand >> execute [
	"The context here is the EpLogBrowserPresenter.
	 In fact, the design of these filters should be changed to move code in EpLogBrowserPresenter's method called to the filter."
	self context filterLatestCodeChanges
]

{ #category : #initialization }
EpLatestCodeChangeFilterCommand >> initialize [
	super initialize.
	self filterClass: EpLatestCodeChangeFilter
]
