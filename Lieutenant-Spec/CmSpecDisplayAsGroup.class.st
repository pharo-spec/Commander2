"
I display a command group as a group in the MenuPresenter.
"
Class {
	#name : #CmSpecDisplayAsGroup,
	#superclass : #CmSpecCommandGroupDisplayStrategy,
	#category : #'Lieutenant-Spec'
}

{ #category : #displaying }
CmSpecDisplayAsGroup >> display: aLtSpecCommandGroup in: aMenuPresenter do: aBlock [
	aMenuPresenter addGroup: [ :menuGroup |
		aBlock value: menuGroup ]
]
