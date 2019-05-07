Class {
	#name : #LtSpecCommandGroup,
	#superclass : #LtCommandsGroupDecorator,
	#instVars : [
		'iconName',
		'displayStrategy'
	],
	#category : #'Lieutenant-Spec'
}

{ #category : #default }
LtSpecCommandGroup class >> defaultDisplayStrategy [
	^ LtSpecDisplayAsSubMenu new
]

{ #category : #default }
LtSpecCommandGroup class >> defaultIconName [
	^ #blank
]

{ #category : #configuring }
LtSpecCommandGroup >> beDisplayedAsGroup [
	self displayStrategy: LtSpecDisplayAsGroup new
]

{ #category : #configuring }
LtSpecCommandGroup >> beDisplayedAsSubMeny [
	self displayStrategy: LtSpecDisplayAsSubMenu new
]

{ #category : #displaying }
LtSpecCommandGroup >> displayIn: aMenuPresenter do: aBlock [
	self displayStrategy display: self in: aMenuPresenter do: aBlock
]

{ #category : #accessing }
LtSpecCommandGroup >> displayStrategy [
	^ displayStrategy
]

{ #category : #accessing }
LtSpecCommandGroup >> displayStrategy: anObject [
	displayStrategy := anObject
]

{ #category : #accessing }
LtSpecCommandGroup >> iconName [
	^ iconName
]

{ #category : #accessing }
LtSpecCommandGroup >> iconName: anObject [
	iconName := anObject
]

{ #category : #initialization }
LtSpecCommandGroup >> initialize [
	super initialize.
	self iconName: self class defaultIconName.
	self displayStrategy: self class defaultDisplayStrategy
]
