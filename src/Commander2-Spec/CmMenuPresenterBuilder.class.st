"
I am a visitor that builds a Spec MenuPresenter from a commands and commands group.
"
Class {
	#name : #CmMenuPresenterBuilder,
	#superclass : #CmVisitor,
	#instVars : [
		'menuPresenter',
		'stack'
	],
	#category : #'Commander2-Spec-Visitors'
}

{ #category : #accessing }
CmMenuPresenterBuilder class >> menuPresenterClass [
	^ MenuPresenter
]

{ #category : #initialization }
CmMenuPresenterBuilder >> initialize [
	super initialize.
	self menuPresenter: self class menuPresenterClass new.
	stack := Stack new
					push: self menuPresenter;
					yourself.
]

{ #category : #accessing }
CmMenuPresenterBuilder >> menuPresenter [
	^ menuPresenter
]

{ #category : #accessing }
CmMenuPresenterBuilder >> menuPresenter: anObject [
	menuPresenter := anObject
]

{ #category : #visiting }
CmMenuPresenterBuilder >> visitLtCommand: aCmCommand [
	aCmCommand displayIn: stack top do: [ :item |
		item
			name: aCmCommand name;
			description: aCmCommand description;
			icon: aCmCommand icon;
			action: [ aCmCommand execute ];
			in: [ :i | 
				aCmCommand hasShortcut
					ifTrue: [ i shortcut: aCmCommand shortcutKey ] ] ].
]

{ #category : #visiting }
CmMenuPresenterBuilder >> visitLtCommandsGroup: aCmCommandsGroup [
	aCmCommandsGroup isRoot
		ifTrue: [ 
			super visitLtCommandsGroup: aCmCommandsGroup.
			^ self ].
	
	aCmCommandsGroup displayIn: stack top do: [ :specGroupOrSubMenu |
		stack push: specGroupOrSubMenu.
		super visitLtCommandsGroup: aCmCommandsGroup.
		stack pop ]
]
