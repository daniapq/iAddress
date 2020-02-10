"
Contact model class

Instance Variables
	birthdate:		<aDate>
	emailAddress:		<aString>
	gender:		<aGender>
	name:		<aString>
	requestsEmailUpdates:		<aBoolean>
"
Class {
	#name : #Contact,
	#superclass : #Object,
	#instVars : [
		'name',
		'emailAddress',
		'gender',
		'requestsEmailUpdates',
		'birthdate'
	],
	#classVars : [
		'Database'
	],
	#category : #'iAddress-Models'
}

{ #category : #accessing }
Contact class >> addContact: aContact [

	self contacts add: aContact
]

{ #category : #accessing }
Contact class >> contacts [

	Database ifNil: [ self createSampleDatabase ].
	^ Database
]

{ #category : #initialization }
Contact class >> createSampleDatabase [

	Database := OrderedCollection new
		add: (self name: 'Bob Jones' emailAddress: 'bob@nowhere.com');
		add: (self name: 'Steve Smith' emailAddress: 'sm@nowhere.com');
		yourself
]

{ #category : #initialization }
Contact class >> name: nameString emailAddress: emailString [

	^ self new
		name: nameString;
		emailAddress: emailString;
		yourself
]

{ #category : #accessing }
Contact class >> removeContact: aContact [

	self contacts remove: aContact
]

{ #category : #accessing }
Contact >> beFemale [

	gender := #Female
]

{ #category : #accessing }
Contact >> beMale [

	gender := #Male
]

{ #category : #accessing }
Contact >> birthdate [

	^ birthdate ifNil: [ birthdate := Date today ]
]

{ #category : #accessing }
Contact >> birthdate: aDate [

	birthdate := aDate
]

{ #category : #accessing }
Contact >> emailAddress [

	^ emailAddress
]

{ #category : #accessing }
Contact >> emailAddress: aString [

	emailAddress := aString
]

{ #category : #accessing }
Contact >> gender [

	^ gender ifNil: [ gender := #Male ]
]

{ #category : #accessing }
Contact >> isFemale [

	^ gender = #Female
]

{ #category : #accessing }
Contact >> isMale [

	^ gender = #Male
]

{ #category : #accessing }
Contact >> name [

	^ name
]

{ #category : #accessing }
Contact >> name: aString [

	name := aString
]

{ #category : #accessing }
Contact >> requestsEmailUpdates [

	^ requestsEmailUpdates ifNil: [ requestsEmailUpdates := false ]
]

{ #category : #accessing }
Contact >> requestsEmailUpdates: aBoolean [

	requestsEmailUpdates := aBoolean
]
