Class {
	#name : #ClassListPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'classList'
	],
	#category : #'Lieutenant-Example'
}

{ #category : #specs }
ClassListPresenter class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :c | c add: #classList ];
		yourself
]

{ #category : #example }
ClassListPresenter class >> example [ 
	<sampleInstance>
	
	^ self new openWithSpec
]

{ #category : #'as yet unclassified' }
ClassListPresenter class >> menuBla: aBuilder [
	<Bla>

	(aBuilder item: #'Browse full')
		keyText: 'b';
		selector: #browseMethodFull;
		withSeparatorAfter.
]

{ #category : #menu }
ClassListPresenter >> browseMethodFull [

	Smalltalk tools browser openOnClass: self selectedClass
]

{ #category : #accessing }
ClassListPresenter >> classList [
	^ classList
]

{ #category : #accessing }
ClassListPresenter >> classList: anObject [
	classList := anObject
]

{ #category : #initialization }
ClassListPresenter >> classMenu: aMenu [

	aMenu addTitle: 'Class list'.
	aMenu addAllFromPragma: 'Bla' target: self.
	^ aMenu
]

{ #category : #initialization }
ClassListPresenter >> initialize [ 
	super initialize.
	
	classList value 
]

{ #category : #initialization }
ClassListPresenter >> initializeWidgets [
	
	classList := self instantiate: FastTablePresenter.
	classList items: Object withAllSubclasses. 
	classList menu: [ :aMenu | self classMenu: aMenu ].
]

{ #category : #initialization }
ClassListPresenter >> menuBla: aBuilder [
	<Bla>

	(aBuilder item: #'Browse full')
		keyText: 'b';
		selector: #browseMethodFull;
		withSeparatorAfter.
]

{ #category : #initialization }
ClassListPresenter >> selectedClass [

	 ^ classList selectedItem
]
