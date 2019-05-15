Extension { #name : #CmCommand }

{ #category : #'*Commander2-Spec' }
CmCommand >> asSpecCommand [
	"Subclasses might override this method to define default icon and shortcut."
	^ self decorateWith: CmSpecCommand
]

{ #category : #'*Commander2-Spec' }
CmCommand >> asSpecCommandWithIconNamed: aSymbol [
	^ self asSpecCommand
		iconName: aSymbol;
		yourself
]

{ #category : #'*Commander2-Spec' }
CmCommand >> asSpecCommandWithIconNamed: aSymbol shortcutKey: aKMKeyCombination [
	^ self asSpecCommand
		iconName: aSymbol;
		shortcutKey: aKMKeyCombination;
		yourself
]

{ #category : #'*Commander2-Spec' }
CmCommand >> asSpecCommandWithShortcutKey: aKMKeyCombination [
	^ self asSpecCommand
		shortcutKey: aKMKeyCombination;
		yourself
]
