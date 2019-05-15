Extension { #name : #CmCommandsGroup }

{ #category : #'*Lieutenant-Spec' }
CmCommandsGroup >> asSpecGroup [
	"Subclasses might override this method to define default icon."
	^ self decorateWith: LtSpecCommandGroup
]

{ #category : #'*Lieutenant-Spec' }
CmCommandsGroup >> asSpecGroupWithIconNamed: aSymbol [
	^ self asSpecGroup
		iconName: aSymbol;
		yourself
]
