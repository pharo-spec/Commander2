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
			icon: (self iconNamed: aLtCommand iconName);
			action: [ aLtCommand execute ] ]
]

{ #category : #visiting }
LtMenuPresenterBuilder >> visitLtCommandsGroup: aLtCommandsGroup [
	aLtCommandsGroup displayIn: stack top do: [ :specGroupOrSubMenu |
		stack push: specGroupOrSubMenu.
		super visitLtCommandsGroup: aLtCommandsGroup.
		stack pop ]
]
