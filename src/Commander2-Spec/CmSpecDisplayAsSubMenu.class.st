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
		| subMenu |
		menuItem
			name: aCmSpecCommandGroup name;
			description: aCmSpecCommandGroup description;
			icon: (self iconNamed: aCmSpecCommandGroup iconName).
		subMenu := MenuPresenter new.
		aBlock value: subMenu.
		menuItem subMenu: subMenu ]
]
