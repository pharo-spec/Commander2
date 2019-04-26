Class {
	#name : #LtNoIconCommandForTest,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Tests'
}

{ #category : #initialization }
LtNoIconCommandForTest >> initialize [ 
	
	super initialize.
	hasIcon := false.
]
