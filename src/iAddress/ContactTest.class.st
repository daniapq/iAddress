Class {
	#name : #ContactTest,
	#superclass : #TestCase,
	#instVars : [
		'contact'
	],
	#category : #'iAddress-Tests'
}

{ #category : #running }
ContactTest >> setUp [

	super setUp.
	contact := Contact name: 'Bob Dylan' emailAddress: 'bob@nowhere.com'
]

{ #category : #running }
ContactTest >> tearDown [

	contact := nil.
	super tearDown
]

{ #category : #tests }
ContactTest >> testBeFemale [

	contact beFemale.
	self assert: contact isFemale equals: true
]

{ #category : #tests }
ContactTest >> testBeMale [

	contact beMale.
	self assert: contact isMale equals: true
]

{ #category : #tests }
ContactTest >> testGetBirthdate [

	self assert: contact birthdate equals: Date today
]

{ #category : #tests }
ContactTest >> testGetEmailAddress [

	self assert: contact emailAddress equals: 'bob@nowhere.com'
]

{ #category : #tests }
ContactTest >> testGetGender [

	self assert: contact gender equals: #Male
]

{ #category : #tests }
ContactTest >> testGetName [

	self assert: contact name equals: 'Bob Dylan'
]

{ #category : #tests }
ContactTest >> testGetRequestsEmailUpdates [

	self assert: contact requestsEmailUpdates equals: false
]

{ #category : #tests }
ContactTest >> testIsFemale [

	self assert: contact isFemale equals: false
]

{ #category : #tests }
ContactTest >> testIsMale [

	self assert: contact isMale equals: false
]

{ #category : #tests }
ContactTest >> testSetBirthdate [

	| date |
	date := Date fromString: '02/02/1997'.
	contact birthdate: date.
	self assert: contact birthdate equals: date
]

{ #category : #tests }
ContactTest >> testSetEmailAddress [

	contact emailAddress: 'bobd@nowhere.com'.
	self assert: contact emailAddress equals: 'bobd@nowhere.com'
]

{ #category : #tests }
ContactTest >> testSetName [

	contact name: 'Bob Marley'.
	self assert: contact name equals: 'Bob Marley'
]

{ #category : #tests }
ContactTest >> testSetRequestsEmailUpdates [

	contact requestsEmailUpdates: true.
	self assert: contact requestsEmailUpdates equals: true
]
