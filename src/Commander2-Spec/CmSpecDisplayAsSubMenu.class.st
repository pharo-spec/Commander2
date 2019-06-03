"
I display a command group as a submenu in the MenuPresenter.
"
Class {
	#name : #CmSpecDisplayAsSubMenu,
	#superclass : #CmSpecCommandGroupDisplayStrategy,
	#category : #'Commander2-Spec-Core'
}

{ #category : #displaying }
CmSpecDisplayAsSubMenu >> display: aCmSpecCommandGroup in: aMenuPresenter do: aBlock [

	aMenuPresenter addItem: [ :menuItem |
		menuItem subMenu: (self 
			fillSubMenuIn: menuItem 
			with: aCmSpecCommandGroup 
			do: aBlock) ]
]

{ #category : #private }
CmSpecDisplayAsSubMenu >> fillSubMenuIn: menuItem with: aCmSpecCommandGroup do: aBlock [
	| subMenu |
	
	menuItem
		name: aCmSpecCommandGroup name;
		description: aCmSpecCommandGroup description;
		icon: aCmSpecCommandGroup icon.
	subMenu := MenuPresenter new.
	aBlock value: subMenu.
	^ subMenu
]
