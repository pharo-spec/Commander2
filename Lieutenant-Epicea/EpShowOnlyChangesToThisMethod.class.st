"
TODO: Comment correctly.

WARNING: this is strange because it should be an EpFilterCommand but in Epicea code it uses no EpFilter.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpShowOnlyChangesToThisMethod,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #converting }
EpShowOnlyChangesToThisMethod >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallFind;
		yourself
]

{ #category : #hooks }
EpShowOnlyChangesToThisMethod >> execute [
	self flag: #WARNING . "See class comment."
	self context filterAllChangesToSelection
]

{ #category : #initialization }
EpShowOnlyChangesToThisMethod >> initialize [
	super initialize.
	self
		basicName: 'Show only changes to this method';
		basicDescription: 'Show only additions, modifications or removals of this method.'
]
