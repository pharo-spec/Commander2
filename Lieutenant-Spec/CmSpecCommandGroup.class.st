"
I am a command group decorator adding informations useful when for usage in context of a Spec application.

Basically, I add:
- an #icon (#blank by default)
- the strategy to display commands group in a MenuPresenter
"
Class {
	#name : #CmSpecCommandGroup,
	#superclass : #CmCommandsGroupDecorator,
	#instVars : [
		'iconName',
		'displayStrategy',
		'isRoot'
	],
	#category : #'Lieutenant-Spec'
}

{ #category : #default }
CmSpecCommandGroup class >> defaultDisplayStrategy [
	^ CmSpecDisplayAsSubMenu new
]

{ #category : #default }
CmSpecCommandGroup class >> defaultIconName [
	^ #blank
]

{ #category : #converting }
CmSpecCommandGroup >> asMenuPresenter [
	^ CmMenuPresenterBuilder new
		visit: self;
		menuPresenter
]

{ #category : #configuring }
CmSpecCommandGroup >> beDisplayedAsGroup [
	self displayStrategy: CmSpecDisplayAsGroup new
]

{ #category : #configuring }
CmSpecCommandGroup >> beDisplayedAsSubMenu [
	self displayStrategy: CmSpecDisplayAsSubMenu new
]

{ #category : #configuring }
CmSpecCommandGroup >> beRoot [
	self isRoot: true.
]

{ #category : #displaying }
CmSpecCommandGroup >> displayIn: aMenuPresenter do: aBlock [
	self displayStrategy display: self in: aMenuPresenter do: aBlock
]

{ #category : #accessing }
CmSpecCommandGroup >> displayStrategy [
	^ displayStrategy
]

{ #category : #accessing }
CmSpecCommandGroup >> displayStrategy: anObject [
	displayStrategy := anObject
]

{ #category : #accessing }
CmSpecCommandGroup >> iconName [
	^ iconName
]

{ #category : #accessing }
CmSpecCommandGroup >> iconName: anObject [
	iconName := anObject
]

{ #category : #initialization }
CmSpecCommandGroup >> initialize [
	super initialize.
	self iconName: self class defaultIconName.
	self displayStrategy: self class defaultDisplayStrategy.
	self isRoot: false
]

{ #category : #'as yet unclassified' }
CmSpecCommandGroup >> installShortcutsIn: aPresenter [ 
	CmShortcutInstaller new
		presenter: aPresenter;
		visit: self
]

{ #category : #accessing }
CmSpecCommandGroup >> isRoot [
	^ isRoot
]

{ #category : #accessing }
CmSpecCommandGroup >> isRoot: anObject [
	isRoot := anObject
]
