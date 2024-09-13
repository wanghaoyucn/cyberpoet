SET TALK Off
SET EXAC ON
CLOS DATA
CLEA
ACCE '请输入韵脚(选择以下之一：A，AI，AN，ANG，AO，CH，E，EE，EI，EN，ENG，I，ING，M，O，ONG，R，U，UI，V，Z）'  TO YJB
yjb=uppe(yjb)
J=''
USE CPCS
MMB=MMS
DDB=DDS
DJB=DJS
XXB=XXS
mcsb=mms
dcsb=dds
djcsb=djs
xxcsb=xxs
ttscsb=tts
ssscsb=sss
jgcsb=jgs
use
SELE 5
USE CPJGD
COUN TO X
use cpcs
*x=HSB
SELE 6
USE CP
zap
SELE 7
USE CPJGD
SELE 5
xx=0
BB=2
DO WHIL xx<x
xx=xx+1
*BB=jgcsb*rand()
SELE 7
if bb<1
bb=1
endi
*GO BB
IF .NOT.EOF()
SKIP
ELSE
GO TOP
ENDI
CSB=CS
H=0
j=''
DO WHIL H<24
SELE 7
H=H+1
H1=H+1
IF H<10
ZD="J"+ALLTRIM(STR(H,2))
ZD1='J'+ALLTRIM(STR(H1,2))
ELSE
ZD='J'+STR(H,2)
ZD1='J'+ALLTRIM(STR(H1,2))
ENDI
JGB=&ZD.
JGB1=&ZD1.
SELE 8
DO CASE
CASE JGB='DD'
USE CPDD
CS=DDB
lgb1=dcsb
CASE JGB='DJ'
USE CPDJ
CS=DJB
lgb1=djcsb
CASE JGB='MM'
USE CPMM
CS=MMB
lgb1=mcsb
CASE JGB='XX'
USE CPXX
CS=XXB
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
J=J+TRIM(C)
LOOP
ENDC
DMB=lgb1*rand()
SELE 8
IF XX=1.OR.XX=2.OR.XX=4.OR.XX=6.OR.XX=8.OR.XX=10;
.OR.XX=12.OR.XX=14.OR.XX=16.OR.XX=18.OR.XX=20.OR.XX=22
IF H=CSB.AND.CSB<>0
DO CPYL
EXIT
LOOP
ENDI
ENDI
if dmb<1
dmb=1
endi
GO dmb
C=AA
J=J+trim(C)
ENDD
sele 6
appe blan
repl poem with j
sele 5
endd
clos data
retu
