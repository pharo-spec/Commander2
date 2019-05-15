"
TODO: Comment correctly.

WARNING: this is strange because it should be an EpFilterCommand but in Epicea code it uses no EpFilter.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpShowOnlyChangesToThisPackage,
	#superclass : #CmCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #converting }
EpShowOnlyChangesToThisPackage >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallFind;
		yourself
]

{ #category : #hooks }
EpShowOnlyChangesToThisPackage >> execute [
	self flag: #WARNING . "See class comment."
	self context filterAllChangesToSelectionPackage
]

{ #category : #initialization }
EpShowOnlyChangesToThisPackage >> initialize [
	super initialize.
	self
		basicName: 'Show only changes in this package';
		basicDescription: 'Show only additions, modifications or removals of this package.'
]
