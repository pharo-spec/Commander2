"
I display a command group as a group in the MenuPresenter.
"
Class {
	#name : #LtSpecDisplayAsGroup,
	#superclass : #LtSpecCommandGroupDisplayStrategy,
	#category : #'Lieutenant-Spec'
}

{ #category : #displaying }
LtSpecDisplayAsGroup >> display: aLtSpecCommandGroup in: aMenuPresenter do: aBlock [
	aMenuPresenter addGroup: [ :menuGroup |
		aBlock value: menuGroup ]
]
