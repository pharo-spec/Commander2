Class {
	#name : #LtContactBookCommand,
	#superclass : #LtCommand,
	#category : #'Lieutenant-ContactBook-Commands'
}

{ #category : #accessing }
LtContactBookCommand >> contactBook [
	"Again, this is totally optional, it justs make access to selected contact easier.
	 Thus code in #execute is easier to read.
	"
	^ self contactBookPresenter contactBook
]

{ #category : #accessing }
LtContactBookCommand >> contactBookPresenter [
	"Optional, simply aliasing the context (the LtContactBookPresenter) to a more explicit name.
	 It will just make the code easier to read in #execute methods of my subclasses.
	"
	^ self context
]

{ #category : #testing }
LtContactBookCommand >> hasSelectedContact [
	^ self contactBookPresenter isContactSelected
]

{ #category : #accessing }
LtContactBookCommand >> selectedContact [
	"Again, this is totally optional, it justs make access to selected contact easier.
	 Thus code in #execute is easier to read.
	"
	^ self contactBookPresenter selectedContact
]
