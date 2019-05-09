Extension { #name : #ComposablePresenter }

{ #category : #'*Lieutenant-Spec' }
ComposablePresenter class >> buildCommandsGroupWith: presenter forRoot: aLtCommandsGroup [
	"This hook allows you to build your groups of commands.
	 You must attach them to aLtCommandsGroup throught the registration mechanism.
	 The presenter instance to which this group of command will be bound is provided (this is useful for setting commands context).
	 To be overrided by subclasses.
	"
]

{ #category : #'*Lieutenant-Spec' }
ComposablePresenter class >> buildRootCommandsGroupFor: presenterIntance [
	| rootCommandGroup |
	rootCommandGroup := LtCommandsGroup forSpec beRoot.
	"Register default commands."
	self buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup.
	
	"Register extension commands."
	(Pragma allNamed: #lieutenantExtension in: self class)
		do: [ :pragma | (self perform: pragma methodSelector withArguments: { presenterIntance . rootCommandGroup }) ].
	
	^ rootCommandGroup
]

{ #category : #'*Lieutenant-Spec' }
ComposablePresenter >> rootCommandsGroup [
	^ self class buildRootCommandsGroupFor: self
]
