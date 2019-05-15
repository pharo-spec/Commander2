"
I allow to configure how a spec command group display itself in a MenuPresenter.
"
Class {
	#name : #CmSpecCommandGroupDisplayStrategy,
	#superclass : #Object,
	#category : #'Lieutenant-Spec'
}

{ #category : #displaying }
CmSpecCommandGroupDisplayStrategy >> display: aLtSpecCommandGroup in: aMenuPresenter do: aBlock [
	self subclassResponsibility
]
