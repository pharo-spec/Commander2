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

{ #category : #private }
CmMenuPresenterBuilder >> fillItem: aMenuItem with: aCommand [

	aMenuItem
		name: aCommand name;
		description: aCommand description;
		icon: aCommand icon;
		action: [ aCommand execute ].

	aCommand hasShortcutKey ifTrue: [ 
		aMenuItem shortcut: aCommand shortcutKey ].
		
	^ aMenuItem
]

{ #category : #initialization }
CmMenuPresenterBuilder >> initialize [
	
	super initialize.
	self menuPresenter: self class menuPresenterClass new.
	stack := Stack new
		push: self menuPresenter;
		yourself
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
CmMenuPresenterBuilder >> visitCommand: aCmCommand [

	aCmCommand 
		displayIn: stack top 
		do: [ :item | self fillItem: item with: aCmCommand ]
]

{ #category : #visiting }
CmMenuPresenterBuilder >> visitCommandGroup: aCmCommandsGroup [

	aCmCommandsGroup isRoot ifTrue: [ 
		super visitCommandGroup: aCmCommandsGroup.
		^ self ].
	
	aCmCommandsGroup 
		displayIn: stack top 
		do: [ :specGroupOrSubMenu |
			stack push: specGroupOrSubMenu.
			super visitCommandGroup: aCmCommandsGroup.
			stack pop ]
]
