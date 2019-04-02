	NB. handy4uu.ijs
cocurrent 'z'

AZ=: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
CO=: ':'
DT=: '.'
MI=: '-'
NUL=: 0{a.
ST=: '*'
UL=: '_'
and=: *.
any=: +./
az=: 'abcdefghijklmnopqrstuvwxyz'
b2o=: }.@((<' ') ;@,. ])
begins=: [ (] -: [ {.~ [: # ]) [: , ]
beginsWith=: [ (] -: [ {.~ [: # ]) [: , ]

blink=: 4&$: :(4 : 0)
  NB. operate the blink1-tool
  NB. (int) x is the template (t*) to use (--> t)
  NB. Non-empty y ...
  NB. -m <fade-in-milliseconds>
  NB. --blink <number-of-times>
  NB. --red
  NB. --off
f=. '~/sh/blink1-tool'
fade=. 100
color=. 'red'
r=. 255
g=. '0x66'
b=. 0
rgb=. 'ff9900' NB. flame
rgb=. 'ff6600' NB. my yellow
s=. 3  NB. blinks
t0=. '(f) --off -m 0 &'
t1=. '(f) --(color) &'
t2=. '(f) --rgb (r),(g),(b) &'
t3=. '(f) --rgb=(rgb) &'
t4=. '(f) -m (fade) --rgb (r),(g),(b) --blink (s) &'
TEM=: t=. ".'t',":x  NB. t is now the template to use…
z=. sw t
select. y
case. 0 do. z=. sw t0
case. 1 do. z=. sw t  NB. =template selected by: (x)
case. 2 do. z=. sw '(f) -m (fade) --rgb (r),(g),(b) &'
case. 3 do. z=. sw '(f)           --rgb (r),(g),(b) &'
case. 4 do. z=. sw '(f) --red &'
case. 5 do. z=. sw '(f) --green &'
case. 6 do. z=. sw '(f) --blue &'
fcase. 'white' do.
fcase. 'red' do.
fcase. 'green' do.
case. 'blue' do. z=. sw'(f) --(y) &'
NB. case. 'help' do. z=. f  NB. doesn't work! (except in Terminal)
case.        do. z=. sw'(f) (y) &'
end.
smoutput z
2!:1 z
)

brack=: 1 |. '][' , ":
cmx=: [: > <;._2
date=: 6!:0@('YYYY-MM-DD  hh:mm:ss'"_)
day=: dayy&daterev
ddefine=: 1 : 'm&$: : (4 : 0)'

default=: 0&$: :(4 : 0)
	NB. pronoun (y) created with value (x)
	NB. UNLESS name (y) already in-use.
	NB. NOT compatible with the "misc.ijs" version
	NB. which has x<--> swapped.
	NB. Permits MYVAR=: 99 default 'MYVAR'
	NB. as well as:   99 default 'MYVAR'
if. 0<: 4!:0 <y do. y~ return. end.
(y)=:x
)

from=: 4 : 0
  NB. extract x from anytype list y
z=. '<from:unset>'
try.
select. datatype y
  case. 'literal'	do.
	x=. {.x
	if. 'literal'-:datatype x do.
		z=. x lfrom ;:y
	else.	z=. x { ;:y
	end.
  case. 'boxed'	do.
	x=. {.x
	if. 'literal'-:datatype x do.
		z=. x lfrom y
	else.	z=. x{ y
	end.
 fcase. 'floating' do.
  case. 'integer'	do.	z=. x { y
  case.		do.	z=. x { y
end.
catch.
  ''
end.
>z
)

ifdefined=: 0 <: [: 4!:0 <
isBoxed=: 32 = 3!:0
isLit=: 2 2048 e.~ 3!:0
isNo=: isNum *. isScalar
isNum=: 1 4 8 64 128 e.~ 3!:0
isScalar=: [: {. 0 = [: $ $
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
min=: $:/ :<.
n9=: '0123456789'
nb=: ([: }:@; (<' ') ,.~ ,.)@:(":&.>)
not=: -.
o2b=: [: <;._1 ' ' , ]
or=: +.
paren=: 1 |. ')(' , ":
rnd=: 0&$: :(4 : '(<. 0.5 + y*10^x)%10^x')

sl=: 4 : 0
  NB. RELIABLE path catenator
  NB. IAC Thursday 30 August 2018  16:42:51
SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)

sllog=: smoutput@llog
smresolve=: (((<0),(<3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0),<'(';')') ;: ucp)"1
ssw=: smoutput&sw
st=: [: 1!:1 [: < tmp
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
temp=: lasttemp`tmp@.(*@#@])
to=: [ + [: i. [: >: -~
vv=: ":@|:@,:
x2f=: }.@((<10{a.) ;@,. ])@([: (#~ ([: +./\. ' '&~:))&.> <"1)

startonload ''
