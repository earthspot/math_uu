	NB. uu - uuverb.ijs
'==================== [uu] uuverb.ijs ===================='

cocurrent 'uu'

0 :0
Tuesday 30 April 2019  23:57:36
)

uu=: (''&$: :(4 : 0))"1
  NB. convert str: y (e.g. '212 degF') to target units (x)
if. '*'={.y do. uuengine }.y return. end. NB. uuengine call-thru
pushme 'uu'
if. isBoxed y do.
  'valu unit'=. y
  unit=. bris unit
  ralu=. rat valu
else.
  yf=: dltb formatIN y  NB. y--> SI units, esp Fahrenheit--> K
  valu=: valueOf yf
  ralu=: rvalueOf yf	NB. <<<<< rational
	assert. notFloat RALU__=: ralu
  unit=: bris unitsOf yf
end.
	sllog 'uu x y valu ralu unit'
if. 0=#x do.		NB. (x) is empty | monadic invocation
  'coefu rcoefu code'=. qtcode4anyunit unit
  coeft=. 1
  rcoeft=. 1r1	NB. <<<<< rational
  codet=. codeu=. code
  targ=. canon expandcode code  NB. infer target units from: (code)
	sllog 'uu_1 targ unit'
elseif. x-:'=' do.		NB. target units are the nominal units
  targ=. unit
elseif. do.		NB. target units are (x)
  targ=. bris x  NB. (x) in kosher: 'm/s^2' ...NOT 'm s⁻²'
  'coeft rcoeft codet'=. qtcode4anyunit targ
  'coefu rcoefu codeu'=. qtcode4anyunit unit
	sllog 'uu_1 targ unit'
	sllog 'uu_1 coeft coefu rcoeft rcoefu codet codeu'
  if. codet ~: codeu do.
    z=. sw'>>> uu: incompatible units: x=[(x)] targ=[(targ)] unit=[(unit)]'
NB. z=. z,LF, '... coeft=(coeft) coefu=(coefu) rcoeft=(coeft) rcoefu=(coefu) codet=(codet) codeu=(codeu)'
    z return.
  end.
end.
  NB. compute target value: vatarg
if. (cannotScale unit) or (x-:'=') do.
  vatarg=. valu  NB. then formatOUT must itself scale and displace
  ratarg=. ralu	NB. <<<<< rational
else.
  dispt=. displacement targ
  dispu=. displacement unit
  rdispt=. rdisplacement targ	NB. <<<<< rational
  rdispu=. rdisplacement unit	NB. <<<<< rational
	X__  =: coeft,coefu,dispt,dispu
  vatarg=. valu scale_displace~ coeft,coefu,dispt,dispu
	RX__  =: rcoeft,rcoefu,rdispt,rdispu
  ratarg=. ralu scale_displace~ rcoeft,rcoefu,rdispt,rdispu	NB. <<<<< rational
	assert. notFloat RATARG__=: ratarg
end.
  NB. cache the exact value, obtained from the rational calculations
UU_VALUE=: ratarg	NB. <<<<< rational
  NB. Format the target value: vatarg
  NB. BUT ONLY USE the (floating) value, vatarg <<<<< NOT rational
z=. targ formatOUT vatarg
	sllog 'uu_3 z vatarg VEXIN VEX'
  NB. Whatever "take_" verb in formatOUT chimes, sets flag: NO_UNITS_NEEDED
if. NO_UNITS_NEEDED do. z else. deb z,SP,uniform targ end.
)

rvalueOf=: 3 : 0
  NB. extract the (RATIONAL) value of (qty-string) y
  NB. c/f eval, valueOf
try. val=. reval strValueOf y	NB. <<<<< rational
catch. BADRAT end.
)

scale_displace=: 4 : 0
  NB. apply factors and displacements between two UUC constants
  NB. x== coeft,coefu,dispt,dispu
  NB. y== (valu) -value of qty with coefu,dispu
  NB. returned: target value
'coeft coefu dispt dispu'=. z=: x,(4-~#x){.1 1 0 0
vaSI=. dispu + y*coefu  NB. the SI-value of y
(vaSI-dispt)%coeft  NB. undoes SI using dispt;coeft
)

NB. onload 'load temp 94'
onload }: 0 :0
smoutput uu 2r3 ; 'ft'
)
0 :0
smoutput uu '212 degF'
)