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
CmMenuPresenterBuilder >> visitLtCommand: aLtCommand [
	aLtCommand canBeRun "If can not be run, do not add to the menu."
		ifFalse: [ ^ self ].
	
	stack top addItem: [ :item |
		item
			name: aLtCommand name;
			description: aLtCommand description;
			iconName: aLtCommand iconName;
			action: [ aLtCommand execute ];
			in: [ :i | 
				aLtCommand hasShortcut
					ifTrue: [ i shortcut: aLtCommand shortcutKey ] ] ]
]

{ #category : #visiting }
CmMenuPresenterBuilder >> visitLtCommandsGroup: aLtCommandsGroup [
	aLtCommandsGroup isRoot
		ifTrue: [ 
			super visitLtCommandsGroup: aLtCommandsGroup.
			^ self ].
	
	aLtCommandsGroup displayIn: stack top do: [ :specGroupOrSubMenu |
		stack push: specGroupOrSubMenu.
		super visitLtCommandsGroup: aLtCommandsGroup.
		stack pop ]
]
