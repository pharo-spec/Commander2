Extension { #name : #LtContactBookPresenter }

{ #category : #'*Lieutenant-ContactBook-Extensions' }
LtContactBookPresenter class >> changePhoneCommandWith: presenter forRootGroup: aLtCommandsGroup [
	<lieutenantExtension>
	(aLtCommandsGroup / 'Edition')
		register: (LtChangePhoneCommand forSpec context: presenter)
]

{ #category : #'*Lieutenant-ContactBook-Extensions' }
LtContactBookPresenter class >> extraCommandsWith: presenter forRootGroup: aLtCommandsGroup [
	<lieutenantExtension>
	aLtCommandsGroup
		register: ((LtCommandsGroup named: 'Extra') asSpecGroup
						register: ((LtInspectCommand forSpec context: [ presenter selectedContact ])
											basicName: 'Inspect contact';
											yourself);
						yourself)
]
