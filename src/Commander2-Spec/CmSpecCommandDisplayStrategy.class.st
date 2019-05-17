"
I allow to configure how a spec group display itself when shown in UI.
"
Class {
	#name : #CmSpecCommandDisplayStrategy,
	#superclass : #Object,
	#category : #'Commander2-Spec-Core'
}

{ #category : #displaying }
CmSpecCommandDisplayStrategy >> display: aCmSpecCommand in: aMenuPresenter do: aBlock [
	self subclassResponsibility
]
