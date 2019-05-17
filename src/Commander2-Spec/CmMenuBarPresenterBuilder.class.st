"
I am a visitor that builds a Spec MenuBarPresenter from a commands and commands group.
"
Class {
	#name : #CmMenuBarPresenterBuilder,
	#superclass : #CmMenuPresenterBuilder,
	#category : #'Commander2-Spec-Visitors'
}

{ #category : #accessing }
CmMenuBarPresenterBuilder class >> menuPresenterClass [
	^ MenuBarPresenter
]
