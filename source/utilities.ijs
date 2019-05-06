	NB. uu - utilities.ijs
'==================== [z] utilities ===================='

cocurrent 'z'  NB. <<<<< MAKE THESE VISIBLE TO CAL & tests TOO

ident=: ([: , [) -: ([: , ])

choice=: 4 : '((0>.1<.x)){y'
abs=: |
avg=: +/ % #
div=: %
int=: [: <. ] + 0 > ]
mod=: |~
times=: *

test_z_=: test_uu_

ot1=: open bind '~Gitcal/test/test1.ijs'
ot1r=: open bind '~Gitrcal/test/test1.ijs'
ocal=: open bind '~Gitcal/cal.ijs'
ocalr=: open bind '~Gitrcal/cal.ijs'

uut=: openlab=: open bind '~Gituu/uu.ijt'  NB. cf runlab
uucr=:open bind '~Gitruu/uuc.ijs'	NB. UUC in math_uu <<<<<<
cal=: open bind '~Gitcal/source/cal_interface.ijs'
uuu=: open bind '~Gituu/source/uu_interface.ijs'

uuc=: open bind '~addons/math/uu/uuc.ijs'
uuf=: open bind '~addons/math/uu/uuf.ijs'
uum=: open bind '~addons/math/uu/uum.ijs'

test=: 3 : 0
  NB. builtin test of UU - to run it press fkey 5
smoutput '+++ BUILTIN TEST OF UU [CAL, TABULA]'
try. smoutput '--- VERSION of UU -- ',VERSION_uu_ catch. end.
try. smoutput '--- VERSION of CAL -- ',VERSION_cal_ catch. end.
try. smoutput '--- VERSION of TABULA -- ',VERSION_tabby_ catch. end.
  NB. tpaths.ijs - check TABULA TP*vars in _z_
smoutput '--- TP*_z_ paths:'
zz=. 0 2$a:
xx=. 3 : '". y,''_z_'''
zz=.zz ,  (xx z) ;~ z=:'TPAR'	NB. ttarchive
zz=.zz ,  (xx z) ;~ z=:'TPAT'	NB. patch.ijs
zz=.zz ,  (xx z) ;~ z=:'TPCA'	NB. cal.ijs
zz=.zz ,  (xx z) ;~ z=:'TPCL'	NB. cal_log.txt
zz=.zz ,  (xx z) ;~ z=:'TPMC'	NB. manifest (CAL)
zz=.zz ,  (xx z) ;~ z=:'TPMT'	NB. manifest (TABULA)
zz=.zz ,  (xx z) ;~ z=:'TPMU'	NB. manifest (UU)
zz=.zz ,  (xx z) ;~ z=:'TPNG'	NB. toolbar.png
zz=.zz ,  (xx z) ;~ z=:'TPSA'	NB. (SAMPLE*)
zz=.zz ,  (xx z) ;~ z=:'TPTA'	NB. tabula.ijs
zz=.zz ,  (xx z) ;~ z=:'TPTT'	NB. (ttables)
zz=.zz ,  (xx z) ;~ z=:'TPUC'	NB. uuc.ijs
zz=.zz ,  (xx z) ;~ z=:'TPUF'	NB. uuf.ijs
zz=.zz ,  (xx z) ;~ z=:'TPUM'	NB. uum.ijs
zz=.zz ,  (xx z) ;~ z=:'TPUT'	NB. usertools.ijs
zz=.zz ,  (xx z) ;~ z=:'TPUU'	NB. uu.ijs
)

runlabuu=: 3 : 0
  NB. private way to run uu.ijt in j807
  NB.   see: temp 16
if. 0=#y do.
  ]y=. jpath TPUU,'/uu.ijt'
end.  NB. THE LAB UNDER DEVT
if. -.fexist y do.
  smoutput '>>> runlab: file not found: ',y
  return.
end.
]thelab_z_=: y
trace 0	NB. to reset existing verb tracing
require '~addons/labs/labs/labs.ijs'
try. lab_jlab_ thelab
catch.
  require '~addons/labs/labs/labs805.ijs'
  lab_jlab805_ thelab
end.
)

'==================== [uu] utilities ===================='

cocurrent 'uu'

  NB. NEEDS CHECKING against long PI again >>>>>>>>>>>>>>>>>>>>
NB. dfr=: *&(%PI%180)  NO... needs latest truncated PI!
NB. rfd=: *&(PI%180)
dfr=: 3 : '180*y%PI'
rfd=: 3 : 'PI*y%180'

NB. boxed substrings in x at the stars of pattern: y
cutByPattern=: 13 : '((;:y) -. <,ST) -.~ ;:x'
cutByPattern=: ((<,'*') -.~ [: ;: ]) -.~ [: ;: [

report_complex_nouns=: 3 : 0
  NB. check for complex nouns in given locale
loc=. >coname''
nocomplex=. 1
for_no. nl 0 do.  val=. ".nom=. >no
  if. 16=3!:0 val do.
    smoutput nb 'cx:' ; nom ; 'is complex'
    nocomplex=. 0
  end.
end.
  NB. Suppress ok-confirmation...
NB. if. nocomplex do. smoutput 'cx: no nouns are complex in: ',loc end.
i.0 0
)

undefined=: (3 : 0)"0
  NB. test for presence of UNDEFINED
if. -. 128!:5 y do. 0 return. end.
'_.' -: 5!:6 <'y'
)

quoted=: 3 : 0
  NB. =1 iff (y) is a quoted currency
(<toupper y) e. {."1 CUTAB
)

utoks=: 3 : 0
  NB. tokenize y, ensuring leading SP|SL
z=. sp1 y	NB. ensure leading sign-byte: SP|SL
z=. (z e. SP,SL) <;.1 z
)

vt=: viewtable=: ''&$: :(4 : 0)
  NB. y == list of indexes into UUC -- OR ALTERNATIVELY...
  NB.   y == single index (expands to a block of VIEWTABLE lines)
  NB.   y == nominal unit, e.g. 'G'
  NB.   y == open list of nominal units, e.g. 'G N'
  NB. x == OPEN list of names of nouns (usually the table's columns)
  NB. x == '' (defaulted) - use the default list: faux
  NB. VIEWTABLE (if defined) alters the default number of displayed lines (10)
faux=. 'i unitc units unitv uvalc rvalc uvalu rvalu uvald rvald'  NB. x-default value
  NB. …for meaning of a given list, see: terminology.txt
if. '' -:x do. x=. faux end.
if. isNo y do.
  y=. y+i.10 default 'VIEWTABLE'
end.
if. isLit y do.
  y=. units i. b4o y
end.
st =. (":&.>)"0	NB. utility verb: numlist-->string
cst=. ([: st [) ,. [: st ]  NB. utility verb: combine st-ed lists x y
]h=. ,: ;: cols=. x
]i=. i.#UUC
]t=. ". cols rplc SP;' cst '
h,y{t
)
0 :0 NB. SAMPLES...
vt I. uvalc ~: uvalu
vt I. uvald>0
)

dip=: 3 : 0
  NB. y is bool e.g. u2~:unitc or: unitc=_
assert (#y)=(#UUC)
smoutput '+++ how many? - ',": (+/y)
if. 0<+/y do.
smoutput '+++ their IDs?'
smoutput list I. y
smoutput '+++ their names?'
smoutput list units pick~ I. y
smoutput '+++ their codes?'
smoutput list unitc pick~ I. y
end.
smoutput 75#'-'
)

ID=: 3 : 0
  NB. lookup y in (units) -- return IDs
  NB. e.g.  ID 'm kWh gbp' --> 1 37 73
  NB. vt ID 'm kWh gbp'
units i. ;:y
)
