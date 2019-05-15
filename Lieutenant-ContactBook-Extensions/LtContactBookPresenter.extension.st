Extension { #name : #LtContactBookPresenter }

{ #category : #'*Lieutenant-ContactBook-Extensions' }
LtContactBookPresenter class >> changePhoneCommandWith: presenter forRootGroup: aLtCommandsGroup [
	<lieutenantExtension>
	(aLtCommandsGroup / 'Edition') "Inject an additional command in 'Edition' group."
		register: (LtChangePhoneCommand forSpec context: presenter)
]

{ #category : #'*Lieutenant-ContactBook-Extensions' }
LtContactBookPresenter class >> extraCommandsWith: presenter forRootGroup: aLtCommandsGroup [
	<lieutenantExtension>
	aLtCommandsGroup
		register: ((LtCommandsGroup named: 'Extra') asSpecGroup
						basicDescription: 'Extra commands to help during development.';
						"Below is an example of reusing the same command for 2 different purposes."
						register: ((LtInspectCommand forSpec context: [ presenter selectedContact ]) "Here context is computed at the moment the command is executed."
											"The name and description can be adapted for its specific usage."
											basicName: 'Inspect contact';
											basicDescription: 'Open an inspector on the selected contact.';
											yourself);
						register: ((LtInspectCommand forSpec context: [ presenter contactBook ])
											basicName: 'Inspect contact book';
											basicDescription: 'Open an inspector on the contact book.';
											yourself);
						yourself)
]
