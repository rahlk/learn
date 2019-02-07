#! /usr/local/bin/gst

"------| Timm's tricks |------"
FileStream fileIn: 'my.st' "Tim Tricks"!

"Let create a subclass of magic called Num"
Magic subclass: #Num 
  instanceVariableNames: 'n sd mu m2 lo hi'
  classVariableNames: ''
  poolDictionaries: ''
  category: nil !

"Always document..."
Num comment: 'I represent a Num class' !

"Now let's define some methods to run when the instance is created"
!Num class methodsFor: 'Instance Creation'!
new 
  |temp_var|
  'Creating the Num class...' printNl. 
  "Run new for the super class (Magic in our case) and attach it to temp_var"
  temp_var := super new. 
  "Call the init method (see below for definition...)"
  temp_var init.
  "Return whatever temp_var is attached to. Note: temp_var will be destroyed after this" 
  ^temp_var!
!


"There is subtle difference in the following compared to the previous method 
definition, the first one said:
  Account class methodsFor:..., 
and ours says 
  Account methodsFor:.... 
The difference is that the first one defined a method for messages sent directly 
to Account, but the second one is for messages which are sent to Account objects 
once they are created."

!Num methodsFor: 'Instance initialization'!
init
  n := 0.
  sd := 0.0.
  mu := 0.0.
  lo := 1e64.
  hi := -1e64.
  m2 := 0.0.
  ^self "Note to self: self is returned implicitly. 
  So, this line is not required. More for programming clarity"
!!

!Num methodsFor: 'Printing'!
printOn: stream
  super printOn: stream. "Have super print on the stream first"
  ' with number of elements: ' printOn: stream.
  n printOn:stream.
  ', mean: ' printOn: stream.
  mu printOn:stream.
  ', and standard deviation: ' printOn: stream.
  sd printOn:stream.
  '.' printOn:stream!
!

!Num methodsFor: 'Adding numbers'!
numInc: val
  |d|
  (val == '?') ifTrue: [^val]. 
  n := n + 1.
  d := val - mu.
  mu := (mu + (d / n)).
  m2 := m2 + d * (val - mu).
  (n > 2) ifTrue: [sd := (m2/(n - 1)) sqrt]!
!


  

