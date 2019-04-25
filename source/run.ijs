NB. math_uu repo - run
0 :0
Thursday 25 April 2019  01:18:30
-
cocurrent 'base'
open BUILTFILE
open '~Gituu/test/test.ijs'
open '~Gituu/test/test1.ijs'
open '~Gituu/test/test2.ijs'
open '~Gituu/test/test3.ijs'
)

NB.=================================
GIT=: '~Gitruu'  NB. for JAL release
NB.=================================

TESTFILE_z_=: GIT,'/test/test.ijs'

NB. ---------------------------------------------------------

clear 'uu'

3 : 0''
try.	load BUILTFILE
catch.	load BUILTFILE_z_=: GIT,'/uu.ijs'
end.
)

smoutput '--- run.ijs: BUILTFILE loaded: ',BUILTFILE

NB. create an instance of class UU for testing...
NB. (----at present, start locale: uu as its own instance)
uu_z_=: uu_uu_
uuengine_z_=: uuengine_uu_
uuengine_z_'strt'

load TESTFILE
smoutput '--- run.ijs: TESTFILE completed without discrepancies:',LF,TESTFILE

onload_z_=: do