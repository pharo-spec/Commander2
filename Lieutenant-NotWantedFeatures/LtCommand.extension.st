Extension { #name : #LtCommand }

{ #category : #'*Lieutenant-NotWantedFeatures' }
LtCommand >> applyResultIn: aTool [
	"Third and final step of a command application: its impact on the tool that invoked it. By default do nothing."
	
	^ self
	
]

{ #category : #'*Lieutenant-NotWantedFeatures' }
LtCommand >> configureYourselfFrom: aPresenter [
	"Hook - This method is invoked by the command manager (a command executor) to let the command configure itself using information provided by aPresenter.	By default do nothing"
	
]

{ #category : #'*Lieutenant-NotWantedFeatures' }
LtCommand >> execute [
	"The execution of a command is in fact a three steps processs: 1 adaptation of the command to the current state of tool, 2 the execution (this method) and 3 the application of the results to the tool that invoked the command. By default do nothing."
	
	^ self 
]

{ #category : #'*Lieutenant-NotWantedFeatures' }
LtCommand >> prepareForExecutionIn: aTool [
	"Hook - Just before the execution a command may need to perform some actions such as requesting a value from the user. By default do nothing"
	
	^ self
	
]
