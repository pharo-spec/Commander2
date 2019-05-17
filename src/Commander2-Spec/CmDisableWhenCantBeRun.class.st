Class {
	#name : #CmDisableWhenCantBeRun,
	#superclass : #CmSpecCommandDisplayStrategy,
	#category : #'Commander2-Spec-Core'
}

{ #category : #displaying }
CmDisableWhenCantBeRun >> display: aCmSpecCommand in: aMenuOrGroupPresenter do: aBlock [
	aMenuOrGroupPresenter
		addItem: [ :item |
			aBlock value: item.
			item enabled: aCmSpecCommand canBeRun.
			item ]
]
