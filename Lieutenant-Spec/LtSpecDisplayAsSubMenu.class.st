"
I display a command group as a submenu in the MenuPresenter.
"
Class {
	#name : #LtSpecDisplayAsSubMenu,
	#superclass : #LtSpecCommandGroupDisplayStrategy,
	#category : #'Lieutenant-Spec'
}

{ #category : #displaying }
LtSpecDisplayAsSubMenu >> display: aLtSpecCommandGroup in: aMenuPresenter do: aBlock [
	aMenuPresenter addItem: [ :menuItem |
		| subMenu |
		menuItem
			name: aLtSpecCommandGroup name;
			description: aLtSpecCommandGroup description;
			icon: (self iconNamed: aLtSpecCommandGroup iconName).
		subMenu := MenuPresenter new.
		aBlock value: subMenu.
		menuItem subMenu: subMenu ]
]
