"
Contact List View component with a list contacts
"
Class {
	#name : #ContactListView,
	#superclass : #WAComponent,
	#category : #'iAddress-Components'
}

{ #category : #'class initialization' }
ContactListView class >> initialize [

	WAAdmin register: self asApplicationAt: 'contacts'
]

{ #category : #actions }
ContactListView >> addContact [

	| name emailAddress |
	name := self request: 'Name'.
	emailAddress := self request: 'Email address'.
	Contact addContact: (Contact name: name emailAddress: emailAddress)
]

{ #category : #actions }
ContactListView >> editContact: aContact [

	self call: (ContactView new
		contact: aContact;
		yourself)
]

{ #category : #actions }
ContactListView >> removeContact: aContact [

	(self confirm: 'Are you sure that you want to remove this contact?')
		ifTrue: [ Contact removeContact: aContact ]
]

{ #category : #rendering }
ContactListView >> renderContact: aContact on: html [

	html text: aContact name.
	html space.
	html anchor
		url: 'mailTo:', aContact emailAddress;
		with: aContact emailAddress.
	html space.
	html text: '('.
	html anchor
		callback: [ self editContact: aContact ];
		with: 'edit'.
	html space.
	html anchor
		callback: [ self removeContact: aContact ];
		with: 'remove'.
	html text: ')'
]

{ #category : #rendering }
ContactListView >> renderContentOn: html [

	html anchor
		callback: [ self addContact ];
		with: 'Add contacts'.
	html unorderedList: [ 
		Contact contacts do: [ :contact | 
				html listItem: [ self renderContact: contact on: html ] ] ]
]
