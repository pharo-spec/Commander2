Class {
	#name : #LtNoIconCommandForTest,
	#superclass : #LtCommand,
	#category : #'Lieutenant-Test'
}

{ #category : #initialization }
LtNoIconCommandForTest >> initialize [ 
	
	super initialize.
	hasIcon := false.
]
