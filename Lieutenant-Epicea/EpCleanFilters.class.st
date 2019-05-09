"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpCleanFilters,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #decorating }
EpCleanFilters >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallDelete;
		yourself
]

{ #category : #hooks }
EpCleanFilters >> execute [
	self context removeAllFilters
]

{ #category : #hooks }
EpCleanFilters >> name [
	"This name is computed dynamically depending on the context."
	^ 'Clean filters (', self context filters size asString, ' active)'
]
