NB. UU: scientific units conversion package - test1
NB. test verb: uu using redux.ijs
0 :0
Friday 29 March 2019  13:09:20
-
Actual test logs reside in:
ot 2	NB. uunicode 0
ot 3	NB. uunicode 1
ot 4	NB. uunicode 2
ot 5	NB. uunicode 3
)

smoutput PLS,'+++ test1.ijs - entered',PLS

cocurrent'base'

  NB. turn off ALL trace messages --which redux will gag at
trace_uu_ 0
trace_cal_ 0
trace_tabby_ 0

SUCCESS=: <,:'no difference'

require '~proj/redux.ijs'
smoutput r5=. redux 5  NB. uunicode 3
assert r5 -: SUCCESS
smoutput r4=. redux 4  NB. uunicode 2
assert r4 -: SUCCESS
smoutput r3=. redux 3  NB. uunicode 1
assert r3 -: SUCCESS

NB. smoutput r2=. redux 2  NB. uunicode 0
NB. assert r2 -: SUCCESS
NB. <<<<<<<<< THIS LAST TEST FAILS.

smoutput PLS,'--- test1.ijs - completed',PLS