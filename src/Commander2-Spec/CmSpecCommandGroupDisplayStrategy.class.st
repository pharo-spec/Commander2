"
I allow to configure how a spec command group display when shown in UI.
"
Class {
	#name : #CmSpecCommandGroupDisplayStrategy,
	#superclass : #Object,
	#category : #'Commander2-Spec-Core'
}

{ #category : #displaying }
CmSpecCommandGroupDisplayStrategy >> display: aCmSpecCommandGroup in: aMenuPresenter do: aBlock [
	self subclassResponsibility
]
