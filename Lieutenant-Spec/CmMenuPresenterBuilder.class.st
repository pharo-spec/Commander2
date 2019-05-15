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
	#category : #'Lieutenant-Spec'
}

{ #category : #initialization }
CmMenuPresenterBuilder >> initialize [
	super initialize.
	self menuPresenter: MenuPresenter new.
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
	aCmCommand canBeRun "If can not be run, do not add to the menu."
		ifFalse: [ ^ self ].
	
	stack top addItem: [ :item |
		item
			name: aCmCommand name;
			description: aCmCommand description;
			iconName: aCmCommand iconName;
			action: [ aCmCommand execute ];
			in: [ :i | 
				aCmCommand hasShortcut
					ifTrue: [ i shortcut: aCmCommand shortcutKey ] ] ]
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
