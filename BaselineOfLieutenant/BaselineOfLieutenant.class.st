Class {
	#name : #BaselineOfLieutenant,
	#superclass : #BaselineOf,
	#category : #BaselineOfLieutenant
}

{ #category : #baselines }
BaselineOfLieutenant >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		spec 
			package: 'Lieutenant';
			package: 'Lieutenant-Spec' with: [ spec requires: #('Lieutenant') ];
			package: 'Lieutenant-Example';
			package: 'Lieutenant-Tests';
			package: 'Lieutenant-ContactBook'  with: [ spec requires: #('Lieutenant-Spec') ];
			package: 'Lieutenant-ContactBook-Extensions' with: [ spec requires: #('Lieutenant-ContactBook') ];
			package: 'Lieutenant-ToIntegrateInSpec' ]
]
