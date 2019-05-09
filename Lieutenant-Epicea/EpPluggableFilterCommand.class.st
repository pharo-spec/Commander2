"
TODO: Comment correctly.

Extracted behaviour from: EpLogBrowserPresenter>>#filtersSubMenu.
Name and description extracted from: EpLogBrowserPresenter>>#filtersSubMenu
"
Class {
	#name : #EpPluggableFilterCommand,
	#superclass : #LtCommand,
	#instVars : [
		'pluggableFilter'
	],
	#category : #'Lieutenant-Epicea'
}

{ #category : #'instance creation' }
EpPluggableFilterCommand class >> pluggableFilter: anObject [
	^ self new
		pluggableFilter: anObject;
		yourself
]

{ #category : #converting }
EpPluggableFilterCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallFind;
		yourself
]

{ #category : #accessing }
EpPluggableFilterCommand >> description [
	^ self pluggableFilter title
]

{ #category : #hooks }
EpPluggableFilterCommand >> execute [
	self context addFilter: self pluggableFilter
]

{ #category : #accessing }
EpPluggableFilterCommand >> name [
	^ self pluggableFilter title
]

{ #category : #accessing }
EpPluggableFilterCommand >> pluggableFilter [
	^ pluggableFilter
]

{ #category : #accessing }
EpPluggableFilterCommand >> pluggableFilter: anObject [
	pluggableFilter := anObject
]
