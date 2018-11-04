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
			package: 'Lieutenant-Example';
			package: 'Lieutenant-Test' ]
]
