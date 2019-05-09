"
TODO: Comment correctly.

WARNING: this is strange because it should be an EpFilterCommand but in Epicea code it uses no EpFilter.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpShowOnlyIfDoneToday,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #converting }
EpShowOnlyIfDoneToday >> asSpecCommand [
	^ super asSpecCommand
		iconName: #calendar;
		yourself
]

{ #category : #hooks }
EpShowOnlyIfDoneToday >> execute [
	self flag: #WARNING . "See class comment."
	self context filterToday
]

{ #category : #initialization }
EpShowOnlyIfDoneToday >> initialize [
	super initialize.
	self
		basicName: 'Show only if done today'
]
