"
Second version of iAddress application
"
Class {
	#name : #IAddressTwoComponents,
	#superclass : #IAddress,
	#instVars : [
		'list'
	],
	#category : #'iAddress-Components'
}

{ #category : #'class initialization' }
IAddressTwoComponents class >> initialize [

	WAAdmin register: self asApplicationAt: 'iAddressTwo'
]

{ #category : #hooks }
IAddressTwoComponents >> children [ 

	^ super children, (Array with: list)
]

{ #category : #initialization }
IAddressTwoComponents >> initialize [

	super initialize.
	list := PluggableContactListView new.
	list editor: editor
]

{ #category : #rendering }
IAddressTwoComponents >> renderBarOn: html [

	html anchor
		callback: [ list askAndCreateContact ];
		with: 'Add contact'
]

{ #category : #rendering }
IAddressTwoComponents >> renderContentOn: html [

	html form: [ 
		self renderTitleOn: html.
		self renderBarOn: html.
		html break.
		html render: list.
		html horizontalRule.
		html render: editor ]
]
