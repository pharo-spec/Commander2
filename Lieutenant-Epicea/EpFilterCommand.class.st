Class {
	#name : #EpFilterCommand,
	#superclass : #LtCommand,
	#instVars : [
		'filterClass'
	],
	#category : #'Lieutenant-Epicea'
}

{ #category : #'instance creation' }
EpFilterCommand class >> filterClass: anEpFilterClass [
	^ self new
		filterClass: anEpFilterClass;
		yourself
]

{ #category : #converting }
EpFilterCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallFind;
		yourself
]

{ #category : #hooks }
EpFilterCommand >> description [
	^ self filterClass comment
]

{ #category : #accessing }
EpFilterCommand >> filterClass [
	^ filterClass
]

{ #category : #accessing }
EpFilterCommand >> filterClass: anObject [
	filterClass := anObject
]

{ #category : #hooks }
EpFilterCommand >> name [
	^ self filterClass title
]
