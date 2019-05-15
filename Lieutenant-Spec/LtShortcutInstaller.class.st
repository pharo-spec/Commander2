"
I install shortcuts of Spec commands in my #presenter.
"
Class {
	#name : #LtShortcutInstaller,
	#superclass : #LtVisitor,
	#instVars : [
		'presenter'
	],
	#category : #'Lieutenant-Spec'
}

{ #category : #accessing }
LtShortcutInstaller >> presenter [
	^ presenter
]

{ #category : #accessing }
LtShortcutInstaller >> presenter: anObject [
	presenter := anObject
]

{ #category : #visiting }
LtShortcutInstaller >> visitLtCommand: aLtCommand [
	aLtCommand hasShortcut
		ifFalse: [ ^ self ].
	self presenter on: aLtCommand shortcutKey do: [ 
		aLtCommand canBeRun ifTrue: [ aLtCommand execute ] ]
]
