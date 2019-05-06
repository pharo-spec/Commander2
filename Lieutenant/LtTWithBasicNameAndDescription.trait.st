"
I provide #basicDescription and #basicName slots with their accessors and mutators.

I also define #description and #name that are hook to be overrided by my users if they want to generate description or name dynamically (i.e. through computation).
"
Trait {
	#name : #LtTWithBasicNameAndDescription,
	#instVars : [
		'basicName',
		'basicDescription'
	],
	#category : #'Lieutenant-Traits'
}

{ #category : #accessing }
LtTWithBasicNameAndDescription >> basicDescription [
	^ basicDescription
]

{ #category : #accessing }
LtTWithBasicNameAndDescription >> basicDescription: anObject [
	basicDescription := anObject
]

{ #category : #accessing }
LtTWithBasicNameAndDescription >> basicName [
	^ basicName
]

{ #category : #accessing }
LtTWithBasicNameAndDescription >> basicName: anObject [
	basicName := anObject
]

{ #category : #accessing }
LtTWithBasicNameAndDescription >> description [
	"This hook is called to generate a description dynamically.
	 In the case of a command, the context can be used to provide additional
	 contextual information to the String returned.
	 When entering this method, one can expect that the context can be accessed
	 through a call to #context method.
	 By default, my #basicDescription is returned.
	"
	^ self basicDescription
]

{ #category : #accessing }
LtTWithBasicNameAndDescription >> name [
	"This hook is called to generate a name dynamically.
	 In the case of a command, the context can be used to provide additional
	 contextual information to the String returned.
	 When entering this method, one can expect that the context can be accessed
	 through a call to #context method.
	 By default, my #basicName is returned.
	"
	^ self basicName
]
