"
I install shortcuts of Spec commands in my #presenter.
"
Class {
	#name : #CmShortcutInstaller,
	#superclass : #CmVisitor,
	#instVars : [
		'presenter'
	],
	#category : #'Lieutenant-Spec'
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
CmShortcutInstaller >> visitLtCommand: aLtCommand [
	aLtCommand hasShortcut
		ifFalse: [ ^ self ].
	self presenter on: aLtCommand shortcutKey do: [ 
		aLtCommand canBeRun ifTrue: [ aLtCommand execute ] ]
]
