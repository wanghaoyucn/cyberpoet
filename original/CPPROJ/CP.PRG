publ fd,hsb,dsb,jgcsb
SET TALK OFF
SET SAFE OFF
SET DEFA TO c:\cpproj
clos data
CLEA
X='Y'
TEXT
             
±±±±±±±±±±±±±±±±±±±±±±

               计算机诗人    V1。0
               
                                  刘慈欣  99。03
                                  

±±±±±±±±±±±±±±±±±±±±±±
ENDT
WAIT
DO WHIL UPPE(X)='Y'
USE CPCS
jgcsb=jgs
?'请输入以下内容, 以使我的创作多少有点根据:'
wait "分段吗？" to fd
if uppe(fd)="Y"
inpu "分多少段？" to dsb
inpu "每段多少行？" to hsb
do cpjgfd
else 
INPU '您让我作多少行的诗呢?' TO HSB
REPL HS WITH HSB
do cpjgsc
endi
IF UPPE(FD)="Y"
WAIT '需要押韵吗(最好不要，因为押韵后灵感会受到一定束缚）?' TO YL
ELSE
YL="N"
ENDI
IF UPPE(YL)<>'Y'
DO CPZH
ELSE
DO CPZHY
ENDI
l=0
do whil l<20
l=l+1
?chr(7)
endd
WAIT '诗已全部写完了, 请欣赏吧!!'
CLEA
USE CP
DISP OFF ALL
*WAIT '满意吗?' TO X
*CLEA
*IF UPPE(X)='Y'
*acce '请赐题: ' TO TM
*?'好, 我将它存起来, 以供以后欣赏......'
*USE CP1
*APPE BLAN
*REPL POEM WITH '**************************************'
*APPE BLAN
*REPL POEM WITH TM
*APPE BLAN
*REPL POEM WITH '**************************************'
*APPE FROM CP
*ELSE
*?'唉, 那我就把它扔到纸篓里了!'
*ENDI
wait
clea
WAIT ' 再作一首如何? 没关系，不费劲儿的！' TO X
ENDD
CLOS DATA
RETU