Class {
	#name : #CmSpecCommandDisplayStrategy,
	#superclass : #Object,
	#category : #'Commander2-Spec-Core'
}

{ #category : #displaying }
CmSpecCommandDisplayStrategy >> display: aCmSpecCommand in: aMenuPresenter do: aBlock [
	self subclassResponsibility
]
