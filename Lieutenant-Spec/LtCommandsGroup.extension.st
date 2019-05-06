Extension { #name : #LtCommandsGroup }

{ #category : #'*Lieutenant-Spec' }
LtCommandsGroup >> asSpecGroup [
	"Subclasses might override this method to define default icon."
	^ self decorateWith: LtSpecCommandGroup
]

{ #category : #'*Lieutenant-Spec' }
LtCommandsGroup >> asSpecGroupWithIconNamed: aSymbol [
	^ self asSpecGroup
		iconName: aSymbol;
		yourself
]
