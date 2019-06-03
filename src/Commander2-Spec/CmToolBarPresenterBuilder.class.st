"
I build a ToolBarPresenter from a group of commands.

To do that, I visit recursively groups of command breadth first and simple add each command encountered to the tool bar.
"
Class {
	#name : #CmToolBarPresenterBuilder,
	#superclass : #CmVisitor,
	#instVars : [
		'toolbarPresenter'
	],
	#category : #'Commander2-Spec-Visitors'
}

{ #category : #initialization }
CmToolBarPresenterBuilder >> initialize [
	super initialize.
	self toolbarPresenter: ToolBarPresenter new.
]

{ #category : #accessing }
CmToolBarPresenterBuilder >> toolbarPresenter [
	^ toolbarPresenter
]

{ #category : #accessing }
CmToolBarPresenterBuilder >> toolbarPresenter: anObject [
	toolbarPresenter := anObject
]

{ #category : #visiting }
CmToolBarPresenterBuilder >> visitCommand: aCmCommandEntry [
	self toolbarPresenter
		addItem: (ToolBarButton new
						label: aCmCommandEntry name;
						help: aCmCommandEntry description;
						icon: aCmCommandEntry icon;
						action: [ aCmCommandEntry execute ];
						yourself)
]
