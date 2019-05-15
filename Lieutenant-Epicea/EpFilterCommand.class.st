Class {
	#name : #EpFilterCommand,
	#superclass : #CmCommand,
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
EpFilterCommand >> basicName [
	^ self filterClass title
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
