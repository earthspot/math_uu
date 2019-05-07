NB. math_uu repo - run
0 :0
Tuesday 7 May 2019  01:26:58
-
open BUILTFILE
)

cocurrent 'base'

NB.=================================
GIT=. '~Gitruu'  NB. for JAL release
NB.=================================

BUILTFILE_z_=: GIT,'/uu.ijs'
NB. TESTFILE_z_=: GIT,'/test/test.ijs'
TESTFILE_z_=: '~Test/*.ijs'

NB. ---------------------------------------------------------

clear 'uu'
load BUILTFILE

smoutput sw'+++ run.ijs: BUILTFILE=[(BUILTFILE)] loaded ok'

loadall=: [: load&.> ([: pathof&.> <&jpath) ,&.> [: {."1 [: 1!:0 <&jpath
loadall TESTFILE

smoutput sw'--- run.ijs: TESTFILE=[(TESTFILE)] completed ok'

onload_z_=: do  NB. restore for ad-hoc edits of /source/*.ijs