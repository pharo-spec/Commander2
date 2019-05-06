Class {
	#name : #EpCleanFilters,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Epicea'
}

{ #category : #decorating }
EpCleanFilters >> asSpecCommand [
	^ super asSpecCommand
		icon: #smallDelete;
		yourself
]

{ #category : #hooks }
EpCleanFilters >> execute [
	self context removeAllFilters
]
