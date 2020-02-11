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

{ #category : #actions }
ContactView >> cancel [

	self answer: false
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
ContactView >> renderBirthdateOn: html [

	html text: 'Birthday: '.
	html dateInput
		on: #birthdate of: self contact;
		options: #(#day #month #year).
	html break
]

{ #category : #rendering }
ContactView >> renderContentOn: html [
	html
		form: [ 
			self renderNameOn: html.
			self renderEmailOn: html.
			self renderBirthdateOn: html.
			self renderGenderOn: html.
			self renderSendUpdatesOn: html.
			self renderSaveOn: html ]
]

{ #category : #rendering }
ContactView >> renderEmailOn: html [

	html text: 'Email address: '.
	html textInput on: #emailAddress of: self contact.
	html break
]

{ #category : #rendering }
ContactView >> renderGenderOn: html [

	| group |
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
	html break
]

{ #category : #rendering }
ContactView >> renderNameOn: html [

	html text: 'Name: '.
	html textInput on: #name of: self contact.
	html break
]

{ #category : #rendering }
ContactView >> renderSaveOn: html [
	
	html submitButton on: #save of: self
]

{ #category : #rendering }
ContactView >> renderSendUpdatesOn: html [

	html text: 'Send email updates: '.
	html checkbox
		callback: [ :value | self contact requestsEmailUpdates: value ];
		value: self contact requestsEmailUpdates.
	html break
]

{ #category : #actions }
ContactView >> save [

	self answer: true
]
