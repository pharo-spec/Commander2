Class {
	#name : #LtSpecDisplayAsSubMenu,
	#superclass : #LtSpecCommandGroupDisplayStrategy,
	#category : #'Lieutenant-Spec'
}

{ #category : #'as yet unclassified' }
LtSpecDisplayAsSubMenu >> display: aLtSpecCommandGroup in: aMenuPresenter do: aBlock [
	aMenuPresenter addItem: [ :menuItem |
		| subMenu |
		menuItem
			name: aLtSpecCommandGroup name;
			description: aLtSpecCommandGroup description.
		subMenu := MenuPresenter new.
		aBlock value: subMenu.
		menuItem subMenu: subMenu ]
]
