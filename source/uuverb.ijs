	NB. uu - uuverb.ijs
'==================== [uu] uuverb.ijs ===================='

cocurrent 'uu'

0 :0
Monday 6 May 2019  02:17:12
-
'ft/s^2' uu '1 Å h⁻²'
	FAILS
)

uu=: (''&$: :(4 : 0))"1
  NB. convert units: y (e.g. '212 degF') to target: x (e.g. '100 degC')
if. '*'={.y do. uuengine }.y return. end. NB. uuengine call-thru
if. isBoxed y do.
  'valu unit'=. y
  rvalu=. rat valu
else.
]  yf=: dltb formatIN y
]  valu=: valueOf yf
]  rvalu=: rvalueOf yf	NB. <<<<< rational
]  unit=: unitsOf yf
end.
	sllog 'uu x y valu rvalu unit'
  NB. compute target value: rvtarg
if. cannotScale unit do.  NB. formatOUT itself converts given value
  rvtarg=. rvalu	NB. <<<<< rational
elseif. 0=#x do.  NB. (x) is empty | monadic invocation
  'targ rdisp rfactor'=. convert unit
  rvtarg=. (rfactor * rvalu) + rdisp  NB. rdisp always in BASE UNITS
elseif. do.  NB. target units are (x)
  'targ rdisp rfactor'=. x convert unit
  rvtarg=. rfactor * (rvalu + rdisp)
end.
  NB. cache the exact value, obtained from the rational calculations
UU_VALUE=: rvtarg	NB. <<<<< rational
z=. targ formatOUT rvtarg
	sllog 'uu_3 z rvtarg VEXIN VEX'
  NB. Flag: NO_UNITS_NEEDED is set by the take_* verb
if. NO_UNITS_NEEDED do. z else. deb z,SP,uniform targ end.
)

rvalueOf=: 3 : 0
  NB. extract the (RATIONAL) value of (qty-string) y
  NB. c/f eval, valueOf
try. val=. reval strValueOf y	NB. <<<<< rational
catch. BADRAT end.
)

valueOf=: 3 : 0
  NB. extract the (numeric) value of (qty-string) y
  NB. c/f eval
try. val=. ". strValueOf y
catch. _. end.
)

strValueOf=: 3 : 0
  NB. extract the (numeral-string) value of (qty-string) y
  NB. c/f eval
  NB. NEEDS TO HANDLE $ £ % ALSO????
SP taketo deb y rplc '°' ; SP ; 'deg' ; SP
)

unitsOf=: 3 : 0
  NB. extract the (utf-8) units of (qty-string) y
numeral=. strValueOf y
deb y }.~ #numeral
)

NB. onload 'load temp 94' >>>> temp 94 REDUNDANT: scale_displace elimd
onload }: 0 :0
smoutput (x=:'degF') uu (y=:'100 degC')
)
0 :0
smoutput uu '212 degF'
smoutput (x=:'ft/s^2') uu y=:'1 Å h⁻²'
smoutput 'yd' uu 2r3 ; 'ft'
)