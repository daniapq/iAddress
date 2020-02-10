"
Contact view with a contact as model
"
Class {
	#name : #ContactView,
	#superclass : #WAComponent,
	#instVars : [
		'contact'
	],
	#category : #'iAddress-Components'
}

{ #category : #'class initialization' }
ContactView class >> initialize [

	WAAdmin register: self asApplicationAt: 'contact'
]

{ #category : #accessing }
ContactView >> contact [

	^ contact ifNil: [ contact := Contact contacts first ]
]

{ #category : #accessing }
ContactView >> contact: aContact [

	contact := aContact
]

{ #category : #rendering }
ContactView >> renderContentOn: html [

	| group |
	html form: [ 
		
		html text: 'Name: '.
		html textInput on: #name of: self contact.
		html break.
		
		html text: 'Email address: '.
		html textInput on: #emailAddress of: self contact.
		html break.
		
		html text: 'Birthday: '.
		html dateInput on: #birthdate of: self contact;
		options: #(day month year).
		html break.
		
		html text: 'Gender: '.
		group := html radioGroup.
		group radioButton
			selected: self contact isMale;
			callback: [ self contact beMale ].
		html text: 'Male'.
		group radioButton
			selected: self contact isFemale;
			callback: [ self contact beFemale ].
		html text: 'Female'.
		html break.
		
		html text: 'Send email updates: '.
		html checkbox
			callback: [ :value | self contact requestsEmailUpdates: value ];
			value: self contact requestsEmailUpdates.
		html break.

		html submitButton on: #save of: self ]
]

{ #category : #actions }
ContactView >> save [

	self inform: self contact name, 
		'--', self contact emailAddress, 
		'--', self contact gender, 
		'--', self contact requestsEmailUpdates printString,
		'--', self contact birthdate ddmmyyyy
]
