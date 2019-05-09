"
TODO: Comment correctly.

WARNING: this is strange because it should be an EpFilterCommand but in Epicea code it uses no EpFilter.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpShowOnlyChangesToThisClassOrTrait,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #converting }
EpShowOnlyChangesToThisClassOrTrait >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallFind;
		yourself
]

{ #category : #hooks }
EpShowOnlyChangesToThisClassOrTrait >> execute [
	self flag: #WARNING . "See class comment."
	self context filterAllChangesToSelectionBehavior
]

{ #category : #initialization }
EpShowOnlyChangesToThisClassOrTrait >> initialize [
	super initialize.
	self
		basicName: 'Show only changes to this class or trait';
		basicDescription: 'Show only changes in the scope of this class or trait.'
]
