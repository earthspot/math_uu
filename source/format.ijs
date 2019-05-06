	NB. uu - format.ijs
'==================== [uu] format.ijs =================='

cocurrent 'uu'

0 :0
Thursday 15 November 2018  04:10:53
)

NB. Daisychain design tries each give_* in turn until one "chimes"
NB.  (i.e. runs to complation and returns a value)
NB.  or giverr is reached (i.e. the end of the daisychain).
NB. If a give_* fails the next give_* in daisychain is run.
NB. If a give_* knows it's wrong it calls assert.0 to force error.
NB. Simply crashing has the same effect.
NB. Design allows ad-hoc give_* and take_* verbs to be introduced.
NB.
NB. x-arg is a units, e.g. 'gbp'
NB.  and y is the value to be formatted, e.g. to become: '£1.00'.
NB. Chiming give_* NEED NOT APPEND nominal units (typically x_arg).
NB. (It doesn't for 'gbp' or 'hms' or 'deg')
NB. If nominal units can be inferred from value itself
NB.  then give_* sets NO_UNITS_NEEDED=:1
NB.  to tell uu not to append (given) nominal units

register=: 3 : 0
  NB. for use in give_* verbs only
  NB. reports the last give_* verb to be entered
VEX=: y
)

format=: formatOUT=: ''&$: :(4 : 0)
msg '+++ formatOUT: x=[(x)] y=[(y)]'
NO_UNITS_NEEDED=: 0  NB. reset the flag, overridden below
kunits=. bris x  NB. work internally in kosher units
z=. kunits daisychain y
z [msg '--- formatOUT: returns qty:[(z)] by daisy:(VEX)'
)

make_daisychainOUT=: 3 : 0
  NB. makes the daisychain for: formatOUT
>z=. 'give_' nl 3
]z=. (; z,each <' ::'),'giverr'
daisychain=: 13 : ('x(',z,')y')
i.0 0
)

giverr=: 4 : 0
msg '>>> giverr: none chime: x=(x) y=(y)'
sw'(y) [(x)??]'  NB. return an "error" dummy value
)

give_0_angle=: 4 : 0
register'give_0_angle'
  NB. outputs degrees y [deg] as degrees of angle
assert. x -: 'deg'  NB. force error if wrong verb
d=. scino y  NB. rad-->deg conversion specd already in UUC
if. SIC=0 do. z=. sw'(d) deg'
else.   z=. ucode sw'(d)deg'
end.
z [ NO_UNITS_NEEDED=: 1
)

give_0_dms=: 4 : 0
register'give_0_dms'
  NB. converts degrees [deg] to d° m' s"
asec4deg=. 3600 * ]
assert. x -: 'dms'  NB. force error if wrong verb
NB. if. y-:'' do. y=. d4dms 3 59 59 end. ---WRONG
'd m s'=.":each <.each 360 60 60 #: asec4deg |y
if. SIC=0 do. z=. sw'(d) deg (m)'' (s)"'
else.   z=. ucode sw'(d)deg (m)amin (s)asec'
end.
z [ NO_UNITS_NEEDED=: 1
)

give_0_yesno=: 4 : 0
register'give_0_yesno'
NB. 	ssw'+++ give_0_yesno: x=[(crex x)] y=(y)'
  NB. outputs Boolean y [!] as (e.g.) NO or YES
  NB. uses setting of global: ZERO
assert. (,x) -: ,'!'  NB. force error if wrong verb
NO_UNITS_NEEDED=: 1
NB. 	ssw'+++ give_0_yesno: ZERO=[(ZERO)]'
if. y=0 do. ZERO
else.
select. ZERO
case. 'no' do. 'yes'
case. 'NO' do. 'YES'
case. 'off' do. 'on'
case. 'OFF' do. 'ON'
case. 'lo' do. 'hi'
case. 'LO' do. 'HI'
case. 'low' do. 'high'
case. 'LOW' do. 'HIGH'
case. 'false' do. 'true'
case. 'FALSE' do. 'TRUE'
case. do. '~',ZERO  NB. ZERO has unanticipated value
end.
end.
)
0 :0
'!' give_0_yesno 0
'!' give_0_yesno 1
uu '0 !'
'!' uu '0 !'
uu '1 !'
'!' uu '1 !'
)

give_1_temp=: 4 : 0
  NB. NO disp applied on output.
register'give_1_temp'
unit=. ,x
assert. isTemperature unit
sllog 'VEX x y unit disp'
sw'(scino y)'
)
0 :0
'degRo' give_1_temp 373.15
'degRo' uu '373.15 K'
'degRo' uu '1 b.p'
'degRo' uu '1 f.p'
)

give_0_misc=: 4 : 0
register'give_0_misc'
  NB. picks up miscellaneous forms
if. undefined y do. 'UNDEFINED' return. end.
if. SIC>0 do. infinity=. '∞'
else. infinity=. 'infinity'
end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
assert. 0
)

give_9_general=: 4 : 0
register'give_9_general'
  NB. chimes if nothing else does
  NB. Verb names are sorted --> this comes last in: 'give_1_' nl 3
unit=. x
msg '... give_9_general: x=(x) y=(y) unit=(unit)'
sw'(y) (unit)'
)

give_0_hms=: 4 : 0
register'give_0_hms'
  NB. converts seconds [s] to hh:mm:ss
assert. x -: 'hms'  NB. force error if wrong verb
'hh mm ss'=.":each 24 60 60 #: y
if. 10>".hh do. hh=. '0',hh end.
if. 10>".mm do. mm=. '0',mm end.
if. 10>".ss do. ss=. '0',ss end.
sw'(hh):(mm):(ss)'
)

give_2_note=: 4 : 0
register'give_2_note'
assert. x -: 'note'  NB. force error if wrong verb
sw'(note y) note' [ NO_UNITS_NEEDED=: 1
)

give_2_sci=: 4 : 0
register'give_2_sci'
z=. (toupper@hy@scino) y  NB. scientific notation (conventional)
unit=. x
msg '... give_2_sci: x=(x) y=(y) z=(z) unit=(unit)'
z return.
)

give_2_sig=: give_2_sci

make_daisychainOUT''