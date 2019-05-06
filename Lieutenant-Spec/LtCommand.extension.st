Extension { #name : #LtCommand }

{ #category : #'*Lieutenant-Spec' }
LtCommand >> asSpecCommand [
	"Subclasses might override this method to define default icon and shortcut."
	^ self decorateWith: LtSpecCommand
]

{ #category : #'*Lieutenant-Spec' }
LtCommand >> asSpecCommandWithIconNamed: aSymbol [
	^ self asSpecCommand
		iconName: aSymbol;
		yourself
]

{ #category : #'*Lieutenant-Spec' }
LtCommand >> asSpecCommandWithIconNamed: aSymbol shortcutKey: aKMKeyCombination [
	^ self asSpecCommand
		iconName: aSymbol;
		shortcutKey: aKMKeyCombination;
		yourself
]

{ #category : #'*Lieutenant-Spec' }
LtCommand >> asSpecCommandWithShortcutKey: aKMKeyCombination [
	^ self asSpecCommand
		shortcutKey: aKMKeyCombination;
		yourself
]
