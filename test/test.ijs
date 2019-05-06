NB. UU test suite
0 :0
Monday 6 May 2019  05:14:34
)

0 :0
testf=: 3 : 0
  NB. test: format (and friends) with special-needs units
if. 0=#y do. y=. 123.4567 end.
for_no. ;:'eur gbp usd deg ! c eV Hz rad / *' do.
  nom=. ,>no
  smoutput nb nom ; TAB ; nom format y
end.
)

NB. ===================
GIT=. '~Gitruu'
NB. ===================

cocurrent 'base'

PLS_z_=: LF,~LF,60$'+'

smoutput PLS,'+++ test.ijs - entered',PLS

blinkIN_uu_=: empty
blink_uu_=: empty

uunicode_z_=: 3 : 'uu_z_ ''*ssic '',":y'
  NB. ...prefix '*' tells verb: uu it's a uuengine instruction

NB. trace these verbs…
NB. trv 'start qty4i qty4anyunit qty4bareunit'

load GIT , '/test/test4.ijs'
load GIT , '/test/test2.ijs'
load GIT , '/test/test3.ijs'
load GIT , '/test/test1.ijs'

require '~proj/redux.ijs'
redux 14  NB. test SI-conformance with a complex definition
redux 19  NB. test: convert
NB. redux 30  NB. test: temperature scales internals
redux 21  NB. [Cent] [Fahr]

NB. Take the swabs out the patient...
NB. trv 0  NB. turn trace off
blinkIN_uu_=: empty
blink_uu_=: empty

NB. ---------------------------------------------------------
0 :0
Inspect these when analysing failures...
open GIT , '/test/test1.ijs'
open GIT , '/test/test2.ijs'
open GIT , '/test/test3.ijs'
open GIT , '/test/test4.ijs'
)

smoutput PLS,'--- test.ijs - completed',PLS