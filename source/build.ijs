NB. math_uu repo - build
0 :0
Saturday 27 April 2019  18:03:06
-
open BUILTFILE
)

cocurrent 'base'

NB.==================================
GIT=. '~Gitruu'  NB. for JAL release
NB.==================================

NB. TO LOAD JUST THIS BUILTFILE:	fn⌘F9
NB. DITTO THEN RUN:		fnF9

smoutput '--- Build: started for: ',GIT

date_z_=: 6!:0 bind 'YYYY-MM-DD  hh:mm:ss'

NOW=: date''
HEADERFILE_z_=: GIT,'/source/header.ijs'
BUILTFILE_z_=: 1!:1 <jpath GIT,'/builtfile'

RB=: ')'

  NB. Modify header.ijs with current date written into it
HEADERFILE fappend~ LF,'AABUILT=: ',quote NOW

  NB. build BUILTFILE
writesourcex_jp_ (GIT,'/source');BUILTFILE

smoutput '--- Build: completed for: ',GIT