Extension { #name : #ComposablePresenter }

{ #category : #'*Commander2-Spec' }
ComposablePresenter class >> buildCommandsGroupWith: presenter forRoot: aCmCommandsGroup [
	"This hook allows you to build your groups of commands.
	 You must attach them to aLtCommandsGroup throught the registration mechanism.
	 The presenter instance to which this group of command will be bound is provided (this is useful for setting commands context).
	 To be overrided by subclasses.
	"
]

{ #category : #'*Commander2-Spec' }
ComposablePresenter class >> buildRootCommandsGroupFor: presenterInstance [
	| rootCommandGroup |
	rootCommandGroup := CmCommandGroup forSpec beRoot.
	"Register default commands."
	self buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup.
	
	"Register extension commands."
	(Pragma allNamed: #lieutenantExtension in: self class) do: [ :pragma | 
		(self 
			perform: pragma methodSelector 
			withArguments: { presenterInstance . rootCommandGroup }) ].
	
	^ rootCommandGroup
]

{ #category : #'*Commander2-Spec' }
ComposablePresenter >> rootCommandsGroup [
	^ self class buildRootCommandsGroupFor: self
]
