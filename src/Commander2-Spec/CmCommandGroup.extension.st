Extension { #name : #CmCommandGroup }

{ #category : #'*Commander2-Spec' }
CmCommandGroup >> asSpecGroup [
	"Subclasses might override this method to define default icon."
	^ self decorateWith: CmSpecCommandGroup
]

{ #category : #'*Commander2-Spec' }
CmCommandGroup >> asSpecGroupWithIconNamed: aSymbol [
	^ self asSpecGroup
		iconName: aSymbol;
		yourself
]
