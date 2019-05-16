Class {
	#name : #CmMenuBarPresenterBuilderTest,
	#superclass : #CmMenuPresenterBuilderTest,
	#category : #'Commander2-Spec-Tests'
}

{ #category : #running }
CmMenuBarPresenterBuilderTest >> setUp [
	super setUp.
	menuBuilder := CmMenuBarPresenterBuilder new.
]
