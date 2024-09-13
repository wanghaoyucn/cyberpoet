SET TALK Off
clos data
?"正在写诗，请稍候。。。。。"
USE CPCS
mcsb=mms
dcsb=dds
djcsb=djs
xxcsb=xxs
ttscsb=tts
ssscsb=sss
jgcsb=jgs
aa=rand(-1)
use
J=''
SELE 5
*IF UPPE(FD)='Y'
 * X=DHS
 * ELSE
 * USE CPCS
 * x=HSB
*ENDI
*IF UPPE(FD)='Y'
 * USE CPLGD
 *ENDI
use cpjgd
coun to x
use cpcs
SELE 6
USE CP
*IF UPPE(FD)<>'Y'
  zap
*ENDI
SELE 7
USE CPJGD
SELE 5
xx=0
*X是行数
bb=0
DO WHIL xx<x
   xx=xx+1
   *BB是结构号
     *BB=jgcsb*rand()
     bb=bb+1
   SELE 7
if bb<1
bb=1
endi
   if .not.eof()
    skip
   else
    go top
   endi
   *GO BB
   Yhs=0
   j=''
   DO WHIL Yhs<25
      SELE 7
      Yhs=Yhs+1
      *生成字段名J1,J10等
   IF Yhs<10
       ZD="J"+STR(Yhs,1)
   ELSE 
       ZD='J'+STR(Yhs,2)
   ENDI
   JGB=&ZD.
   SELE 8
   DO CASE
   CASE JGB='DD'
       USE CPDD
        lgb1=dcsb
   CASE JGB='DJ'
       USE CPDJ
       lgb1=djcsb
  CASE JGB='MM'
      USE CPMM
       lgb1=mcsb
   CASE JGB='XX'
      USE CPXX
      lgb1=xxcsb
   CASE JGB='TT'
      USE CPTT
      lgb1=ttscsb
   case JGB='SS'
     USE CPSS
     lgb1=ssscsb
  CASE JGB='  '
     EXIT
  OTHE
  C=JGB
  J=J+trim(C)
   LOOP
  ENDC
  dmb=lgb1*rand()
  SELE 8
if dmb<1
 dmb=1
endi 
  GO dmb
  C=AA
  J=J+trim(C)
 endd
sele 6
appe blan
repl poem with j
skip
*?"已写好",XX,"行"
endd
clos data
retu
