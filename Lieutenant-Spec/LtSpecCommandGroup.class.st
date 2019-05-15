"
I am a command group decorator adding informations useful when for usage in context of a Spec application.

Basically, I add:
- an #icon (#blank by default)
- the strategy to display commands group in a MenuPresenter
"
Class {
	#name : #LtSpecCommandGroup,
	#superclass : #LtCommandsGroupDecorator,
	#instVars : [
		'iconName',
		'displayStrategy',
		'isRoot'
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

{ #category : #converting }
LtSpecCommandGroup >> asMenuPresenter [
	^ LtMenuPresenterBuilder new
		visit: self;
		menuPresenter
]

{ #category : #configuring }
LtSpecCommandGroup >> beDisplayedAsGroup [
	self displayStrategy: LtSpecDisplayAsGroup new
]

{ #category : #configuring }
LtSpecCommandGroup >> beDisplayedAsSubMenu [
	self displayStrategy: LtSpecDisplayAsSubMenu new
]

{ #category : #configuring }
LtSpecCommandGroup >> beRoot [
	self isRoot: true.
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
	self displayStrategy: self class defaultDisplayStrategy.
	self isRoot: false
]

{ #category : #'as yet unclassified' }
LtSpecCommandGroup >> installShortcutsIn: aPresenter [ 
	LtShortcutInstaller new
		presenter: aPresenter;
		visit: self
]

{ #category : #accessing }
LtSpecCommandGroup >> isRoot [
	^ isRoot
]

{ #category : #accessing }
LtSpecCommandGroup >> isRoot: anObject [
	isRoot := anObject
]
