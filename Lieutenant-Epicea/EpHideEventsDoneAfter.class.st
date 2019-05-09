"
TODO: Comment correctly.

WARNING: this is strange because it should be an EpFilterCommand but in Epicea code it uses no EpFilter.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpHideEventsDoneAfter,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #converting }
EpHideEventsDoneAfter >> asSpecCommand [
	^ super asSpecCommand
		iconName: #calendar;
		yourself
]

{ #category : #hooks }
EpHideEventsDoneAfter >> execute [
	self flag: #WARNING . "See class comment."
	self context filterBefore
]

{ #category : #initialization }
EpHideEventsDoneAfter >> initialize [
	super initialize.
	self
		basicName: 'Hide events done after'
]
