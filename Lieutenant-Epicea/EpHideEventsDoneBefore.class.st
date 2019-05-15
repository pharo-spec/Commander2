"
TODO: Comment correctly.

WARNING: this is strange because it should be an EpFilterCommand but in Epicea code it uses no EpFilter.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpHideEventsDoneBefore,
	#superclass : #CmCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #converting }
EpHideEventsDoneBefore >> asSpecCommand [
	^ super asSpecCommand
		iconName: #calendar;
		yourself
]

{ #category : #hooks }
EpHideEventsDoneBefore >> execute [
	self flag: #WARNING . "See class comment."
	self context filterAfter
]

{ #category : #initialization }
EpHideEventsDoneBefore >> initialize [
	super initialize.
	self
		basicName: 'Hide events done before'
]
