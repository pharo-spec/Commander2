Class {
	#name : #BaselineOfCommander2,
	#superclass : #BaselineOf,
	#category : #BaselineOfCommander2
}

{ #category : #baselines }
BaselineOfCommander2 >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		spec 
			package: 'Commander2-ToIntegrateInSpec' ];
			package: 'Commander2';
			package: 'Commander2-Spec' with: [ spec requires: #('Commander2' 'Commander2-ToIntegrateInSpec') ];
			package: 'Commander2-Example';
			package: 'Commander2-Tests';
			package: 'Commander2-ContactBook'  with: [ spec requires: #('Commander2-Spec') ];
			package: 'Commander2-ContactBook-Extensions' with: [ spec requires: #('Commander2-ContactBook') ]
]
