Extension { #name : #CmContactBookPresenter }

{ #category : #'*Lieutenant-ContactBook-Extensions' }
CmContactBookPresenter class >> changePhoneCommandWith: presenter forRootGroup: aCmCommandsGroup [
	<lieutenantExtension>
	(aCmCommandsGroup / 'Edition') "Inject an additional command in 'Edition' group."
		register: (CmChangePhoneCommand forSpec context: presenter)
]

{ #category : #'*Lieutenant-ContactBook-Extensions' }
CmContactBookPresenter class >> extraCommandsWith: presenter forRootGroup: aCmCommandsGroup [
	<lieutenantExtension>
	aCmCommandsGroup
		register: ((CmCommandsGroup named: 'Extra') asSpecGroup
						basicDescription: 'Extra commands to help during development.';
						"Below is an example of reusing the same command for 2 different purposes."
						register: ((CmInspectCommand forSpec context: [ presenter selectedContact ]) "Here context is computed at the moment the command is executed."
											"The name and description can be adapted for its specific usage."
											basicName: 'Inspect contact';
											basicDescription: 'Open an inspector on the selected contact.';
											yourself);
						register: ((CmInspectCommand forSpec context: [ presenter contactBook ])
											basicName: 'Inspect contact book';
											basicDescription: 'Open an inspector on the contact book.';
											yourself);
						yourself)
]
