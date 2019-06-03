"
I install shortcuts of Spec commands in my #presenter.
"
Class {
	#name : #CmShortcutInstaller,
	#superclass : #CmVisitor,
	#instVars : [
		'presenter'
	],
	#category : #'Commander2-Spec-Visitors'
}

{ #category : #accessing }
CmShortcutInstaller >> presenter [
	^ presenter
]

{ #category : #accessing }
CmShortcutInstaller >> presenter: anObject [
	presenter := anObject
]

{ #category : #visiting }
CmShortcutInstaller >> visitCommand: aCmCommand [
	aCmCommand hasShortcutKey
		ifFalse: [ ^ self ].
	self presenter on: aCmCommand shortcutKey do: [ 
		aCmCommand canBeRun ifTrue: [ aCmCommand execute ] ]
]
