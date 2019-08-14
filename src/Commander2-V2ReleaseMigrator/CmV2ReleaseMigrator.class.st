"
I migrate code depending on Commander2 v1.2.0 to Commander2 v2.0.0.

Just run

CmV2ReleaseMigrator migrate.

Basically, I do the following renamings of methods (order is important):

#name -> #dynamicName.
#description -> #dynamicDescription.
#basicName -> #name.
#basicDescription -> #description.
"
Class {
	#name : #CmV2ReleaseMigrator,
	#superclass : #Object,
	#instVars : [
		'classes'
	],
	#category : #'Commander2-V2ReleaseMigrator'
}

{ #category : #actions }
CmV2ReleaseMigrator class >> migrate: aCollectionOfClasses [
	^ self new
		classes: aCollectionOfClasses;
		migrate
]

{ #category : #accessing }
CmV2ReleaseMigrator >> classes [
	^ classes
]

{ #category : #accessing }
CmV2ReleaseMigrator >> classes: anObject [
	classes := anObject
]

{ #category : #accessing }
CmV2ReleaseMigrator >> environment [
	^ RBNamespace onEnvironment: (RBPackageEnvironment packages: (self classes collect: #package) asSet asArray)
]

{ #category : #actions }
CmV2ReleaseMigrator >> migrate [
	self classes do: [ :class |
		self migrateClass: class ] displayingProgress: 'Migrating classes to Commander v2.0.0'
]

{ #category : #private }
CmV2ReleaseMigrator >> migrateClass: class [
	self renameMethodWithSelector: #name as: #dynamicName for: class.
	self renameMethodWithSelector: #description as: #dynamicDescription for: class.
	self renameMethodWithSelector: #basicName as: #name for: class.
	self renameMethodWithSelector: #basicName: as: #name: for: class.
	self renameMethodWithSelector: #basicDescription as: #description for: class.
	self renameMethodWithSelector: #basicDescription: as: #description: for: class.
]

{ #category : #private }
CmV2ReleaseMigrator >> renameMethodWithSelector: oldSelector as: newSelector for: aClass [
	| permutation |
	(aClass includesLocalSelector: oldSelector)
		ifFalse: [ ^ self ].
		
	"No permutation."
	permutation := (1 to: (aClass>>oldSelector) argumentNames size) asArray.
	
	(RBRenameMethodRefactoring model: self environment renameMethod: oldSelector in: aClass to: newSelector permutation: permutation) execute
]
