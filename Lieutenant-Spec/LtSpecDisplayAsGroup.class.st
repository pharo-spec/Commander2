Class {
	#name : #LtSpecDisplayAsGroup,
	#superclass : #LtSpecCommandGroupDisplayStrategy,
	#category : #'Lieutenant-Spec'
}

{ #category : #'as yet unclassified' }
LtSpecDisplayAsGroup >> display: aLtSpecCommandGroup in: aMenuPresenter do: aBlock [
	aMenuPresenter addGroup: [ :menuGroup |
		aBlock value: menuGroup ]
]
