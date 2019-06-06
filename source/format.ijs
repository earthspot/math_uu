	NB. uu - format.ijs
'==================== [uu] format.ijs =================='
0 :0
Thursday 6 June 2019  02:32:59
)
cocurrent 'uu'

  NB. MOVED INTO TEST SUITE…
local_format_test=: 3 : 0
sm 'deg' uu '1 rad'
sm 'dms' uu '1 rad'
sm 'hms' uu '3700 s'
sm 'hms' uu '1.1 h'
sm '*' uu '1.1 h'
sm 'note' uu '440 Hz'
sm '*' uu '440 Hz'
sm '!' uu 2
sm '!' uu 1
sm '!' uu '1 /'
sm '!' uu '1 *'
sm '!' uu 0
sm '!' uu '0 /'
sm '!' uu '0 *'
)

format=: formatOUT=: ''&$: :(4 : 0)
  NB. format the quantity (y;x) for output
  NB. ALL temperature scales handled by: format_misc
msg '+++ format_1: x=[(x)] y=[(y)]'
nu=. 3 : 'y[NO_UNITS_NEEDED=:1' NB. append-units
NO_UNITS_NEEDED=: 0  NB. initialize the flag, overridden below
select. kunits=. bris x  NB. work internally in kosher units
 case. 'deg'	do. nu deg y
 case. 'dms'	do. nu dms y
 case. 'hms'	do. hms y
 case. ,'!'	do. nu yesno y
 case. 'note'	do. nu ' note',~ note y
case.		do. x format_misc y
end.
)

format_misc=: 4 : 0
  NB. cf give_0_misc
msg '+++ format_misc: x=[(x)] y=[(y)]'
if. isUndefined y do. 'UNDEFINED' return. end.
if. SIC>0 do. inf=. '∞' else. inf=. 'inf' end.
if. y=__			do. '-',inf
elseif. y=_		do. inf
elseif. isTemperature x	do. sw'(scino y)'  NB. <<<<<<<<<<<<<<<<
elseif.			do. scino y
end.
)

hms=: 3 : 0
  NB. converts value (y) in hours [h] to hh:mm:ss
'hh mm ss'=.":each 24 60 60 #: y * 3600
if. 10>".hh do. hh=. '0',hh end.
if. 10>".mm do. mm=. '0',mm end.
if. 10>".ss do. ss=. '0',ss end.
sw'(hh):(mm):(ss)'
)

deg=: 3 : 0
  NB. converts value (y) in degrees [deg] to d°
  NB. gets the degree symbol up close, but ony if SIC>0
y=. float y	NB. cannot handle rational y !!
if. SIC=0 do. sw'(y) deg'
else.         ucode sw'(y)deg'
end.
)

dms=: 3 : 0
  NB. converts value (y) in degrees [deg] to d° m' s"
asec4deg=. 3600 * ]
'd m s'=.":each <.each 360 60 60 #: asec4deg |y
if. SIC=0 do. sw'(d) deg (m)'' (s)"'
else.         ucode sw'(d)deg (m)amin (s)asec'
end.
)

yesno=: 3 : 0
NB. 	ssw'+++ give_0_yesno: x=[(crex x)] y=(y)'
  NB. outputs Boolean y [!] as (e.g.) NO or YES
  NB. uses setting of global: ZERO
NB. 	ssw'+++ give_0_yesno: ZERO=[(ZERO)]'
if. y=0 do. ZERO return. end.
select. ZERO
case. 'no'	do. 'yes'
case. 'NO'	do. 'YES'
case. 'off'	do. 'on'
case. 'OFF'	do. 'ON'
case. 'lo'	do. 'hi'
case. 'LO'	do. 'HI'
case. 'low'	do. 'high'
case. 'LOW'	do. 'HIGH'
case. 'false'	do. 'true'
case. 'FALSE'	do. 'TRUE'
case. 		do. '~',ZERO  NB. word: ZERO has unforeseen value
end.
)

onload 'local_format_test $0'