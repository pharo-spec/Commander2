Extension { #name : #CmCommandsGroup }

{ #category : #'*Commander2-Spec' }
CmCommandsGroup >> asSpecGroup [
	"Subclasses might override this method to define default icon."
	^ self decorateWith: CmSpecCommandGroup
]

{ #category : #'*Commander2-Spec' }
CmCommandsGroup >> asSpecGroupWithIconNamed: aSymbol [
	^ self asSpecGroup
		iconName: aSymbol;
		yourself
]
