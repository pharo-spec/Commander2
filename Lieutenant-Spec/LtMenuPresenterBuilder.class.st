"
I am a visitor that builds a Spec MenuPresenter from a commands and commands group.
"
Class {
	#name : #LtMenuPresenterBuilder,
	#superclass : #LtVisitor,
	#instVars : [
		'menuPresenter',
		'stack'
	],
	#category : #'Lieutenant-Spec'
}

{ #category : #initialization }
LtMenuPresenterBuilder >> initialize [
	super initialize.
	self menuPresenter: MenuPresenter new.
	stack := Stack new
					push: self menuPresenter;
					yourself.
]

{ #category : #accessing }
LtMenuPresenterBuilder >> menuPresenter [
	^ menuPresenter
]

{ #category : #accessing }
LtMenuPresenterBuilder >> menuPresenter: anObject [
	menuPresenter := anObject
]

{ #category : #visiting }
LtMenuPresenterBuilder >> visitLtCommand: aLtCommand [
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
LtMenuPresenterBuilder >> visitLtCommandsGroup: aLtCommandsGroup [
	aLtCommandsGroup isRoot
		ifTrue: [ 
			super visitLtCommandsGroup: aLtCommandsGroup.
			^ self ].
	
	aLtCommandsGroup displayIn: stack top do: [ :specGroupOrSubMenu |
		stack push: specGroupOrSubMenu.
		super visitLtCommandsGroup: aLtCommandsGroup.
		stack pop ]
]
