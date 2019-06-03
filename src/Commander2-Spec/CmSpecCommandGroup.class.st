"
I am a command group decorator adding informations useful when for usage in context of a Spec application.

Basically, I add:
- an #icon (#blank by default)
- the strategy to display commands group in a MenuPresenter
"
Class {
	#name : #CmSpecCommandGroup,
	#superclass : #CmCommandGroupDecorator,
	#instVars : [
		'displayStrategy',
		'isRoot',
		'icon'
	],
	#category : #'Commander2-Spec-Core'
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
CmSpecCommandGroup >> asMenuBarPresenter [
	^ CmMenuBarPresenterBuilder new
		visit: self;
		menuPresenter
]

{ #category : #converting }
CmSpecCommandGroup >> asMenuPresenter [
	^ CmMenuPresenterBuilder new
		visit: self;
		menuPresenter
]

{ #category : #converting }
CmSpecCommandGroup >> asToolBarPresenter [
	^ CmToolBarPresenterBuilder new
		visit: self;
		toolbarPresenter
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

	self displayStrategy 
		display: self 
		in: aMenuPresenter 
		do: aBlock
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
CmSpecCommandGroup >> icon [ 

	^ icon
]

{ #category : #accessing }
CmSpecCommandGroup >> icon: anIcon [

	icon := anIcon
]

{ #category : #accessing }
CmSpecCommandGroup >> iconName: aSymbol [


	self icon: (self iconNamed: aSymbol)
]

{ #category : #initialization }
CmSpecCommandGroup >> initialize [

	super initialize.
	self displayStrategy: self class defaultDisplayStrategy.
	self isRoot: false
]

{ #category : #'shortcuts installation' }
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
