"
Baseline of iAddress package
"
Class {
	#name : #BaselineOfiAddress,
	#superclass : #BaselineOf,
	#category : #BaselineOfiAddress
}

{ #category : #baselines }
BaselineOfiAddress >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'iAddress' ]
]
