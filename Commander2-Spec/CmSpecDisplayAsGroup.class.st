"
I display a command group as a group in the MenuPresenter.
"
Class {
	#name : #CmSpecDisplayAsGroup,
	#superclass : #CmSpecCommandGroupDisplayStrategy,
	#category : #'Commander2-Spec'
}

{ #category : #displaying }
CmSpecDisplayAsGroup >> display: aCmSpecCommandGroup in: aMenuPresenter do: aBlock [
	aMenuPresenter addGroup: [ :menuGroup |
		aBlock value: menuGroup ]
]
