"
Pluggable component
"
Class {
	#name : #PluggableContactListView,
	#superclass : #ContactListView,
	#instVars : [
		'contactViewers',
		'editor'
	],
	#category : #'iAddress-Components'
}

{ #category : #actions }
PluggableContactListView >> addContact: aContact [

	Contact addContact: aContact.
	self addContactViewerFor: aContact
]

{ #category : #actions }
PluggableContactListView >> addContactViewerFor: aContact [

	contactViewers
		at: aContact
		put: (ReadOnlyOneLinerContactView new
				contact: aContact;
				parent: self;
				yourself)
]

{ #category : #actions }
PluggableContactListView >> askAndCreateContact [

	| name emailAddress |
	name := self request: 'Name'.
	emailAddress := self request: 'Email address'.
	self addContact: (Contact name: name emailAddress: emailAddress)
]

{ #category : #hooks }
PluggableContactListView >> children [ 

	^ contactViewers values
]

{ #category : #accessing }
PluggableContactListView >> contacts [

	^ Contact contacts
]

{ #category : #actions }
PluggableContactListView >> editContact: aContact [

	editor contact: aContact.
]

{ #category : #accessing }
PluggableContactListView >> editor: anEditor [

	editor := anEditor
]

{ #category : #initialization }
PluggableContactListView >> initialize [

	super initialize.
	editor := ContactView new.
	contactViewers := IdentityDictionary new.
	self contacts do: [ :each | self addContactViewerFor: each ]
]

{ #category : #actions }
PluggableContactListView >> removeContact: aContact [

	contactViewers removeKey: aContact.
	Contact removeContact: aContact
]

{ #category : #rendering }
PluggableContactListView >> renderContentOn: html [

	contactViewers valuesDo: [ :each | 
		html render: each.
		html break ]
]
