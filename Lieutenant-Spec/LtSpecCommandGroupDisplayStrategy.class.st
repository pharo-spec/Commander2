"
I allow to configure how a spec command group display itself in a MenuPresenter.
"
Class {
	#name : #LtSpecCommandGroupDisplayStrategy,
	#superclass : #Object,
	#category : #'Lieutenant-Spec'
}

{ #category : #displaying }
LtSpecCommandGroupDisplayStrategy >> display: aLtSpecCommandGroup in: aMenuPresenter do: aBlock [
	self subclassResponsibility
]
