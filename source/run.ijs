NB. math_uu repo - run
0 :0
Saturday 27 April 2019  18:06:07
-
open BUILTFILE
open '~Gituu/test/test.ijs'
open '~Gituu/test/test1.ijs'
open '~Gituu/test/test2.ijs'
open '~Gituu/test/test3.ijs'
)

cocurrent 'base'

NB.=================================
GIT=. '~Gitruu'  NB. for JAL release
NB.=================================

BUILTFILE_z_=: GIT,'/uu.ijs'
TESTFILE_z_=: GIT,'/test/test.ijs'

NB. ---------------------------------------------------------

clear 'uu'

load BUILTFILE

smoutput '+++ run.ijs: BUILTFILE loaded: ',BUILTFILE

NB. create an instance of class UU for testing...
NB. (----at present, start locale: uu as its own instance)
uu_z_=: uu_uu_
uuengine_z_=: uuengine_uu_
uuengine_z_'strt'

load TESTFILE
smoutput '--- run.ijs: TESTFILE completed without discrepancies:',LF,TESTFILE

onload_z_=: do