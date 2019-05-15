Extension { #name : #CmCommand }

{ #category : #'*Lieutenant-Spec' }
CmCommand >> asSpecCommand [
	"Subclasses might override this method to define default icon and shortcut."
	^ self decorateWith: LtSpecCommand
]

{ #category : #'*Lieutenant-Spec' }
CmCommand >> asSpecCommandWithIconNamed: aSymbol [
	^ self asSpecCommand
		iconName: aSymbol;
		yourself
]

{ #category : #'*Lieutenant-Spec' }
CmCommand >> asSpecCommandWithIconNamed: aSymbol shortcutKey: aKMKeyCombination [
	^ self asSpecCommand
		iconName: aSymbol;
		shortcutKey: aKMKeyCombination;
		yourself
]

{ #category : #'*Lieutenant-Spec' }
CmCommand >> asSpecCommandWithShortcutKey: aKMKeyCombination [
	^ self asSpecCommand
		shortcutKey: aKMKeyCombination;
		yourself
]
