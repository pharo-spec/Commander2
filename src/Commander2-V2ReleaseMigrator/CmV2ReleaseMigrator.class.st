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
	#category : #'Commander2-V2ReleaseMigrator'
}

{ #category : #actions }
CmV2ReleaseMigrator class >> migrate [
	<script>
	^ self new migrate
]

{ #category : #actions }
CmV2ReleaseMigrator >> migrate [
	CmCommand allSubclassesDo: [ :class |
		self renameMethodWithSelector: #name as: #dynamicName for: class.
		self renameMethodWithSelector: #description as: #dynamicDescription for: class.
		self renameMethodWithSelector: #basicName as: #name for: class.
		self renameMethodWithSelector: #basicDescription as: #description for: class. ]
]

{ #category : #private }
CmV2ReleaseMigrator >> renameMethodWithSelector: oldSelector as: newSelector for: aClass [
	| permutation |
	(aClass includesLocalSelector: oldSelector)
		ifFalse: [ ^ self ].
		
	"No permutation."
	permutation := (1 to: (aClass>>#oldSelector) arguments size) asArray.
	
	(RBRenameMethodRefactoring renameMethod: oldSelector in: aClass to: newSelector permutation: permutation) execute
]
