proc create_structure

para duanshu,hangshu,fengge,yunjiao

sele 1
use temp_jg1
zap
sele 2
use cpjg
sele 3
use cpcs
jiegoushu=jgs
use
panduan='a'

for i=1 to hangshu

  panduan_2=.F.
  if int(hangshu/2)=hangshu/2
    panduan_2=(i=1 .or. int(i/2)=i/2)
  else
    panduan_2=(int((i+1)/2)=(i+1)/2)
  endi

  sele 2
  if fengge='Y'
    lilei=0
    do whil panduan<>'  ' .or. lilei=0
*�����ѭ��������fengge<>'Y'��ѭ����һ��panduan<>'  '��Ŀ���ǲ�ѡ��ԭʼ�ṹ�����ڵ���10�ľ��ͣ���ʵ�������ķ��
      lilei=1
      jlb=int(jiegoushu*rand())+1
      go jlb
      panduan=J10
      if panduan_2 .and. cs=0 .and. yunjiao<>'   ' .and. allt(limited)<>allt(yunjiao)
*����ҪѺ�ϵ�ʱ�����������еľ��Ͳ��ǿ�������Ѻ�ϵľ��ͣ�����ѡ�Ͻź͸þ��͹涨���ϽŲ�ͬʱ
        if allt(limited)<>'E'
*limitedΪE������þ���ĩβ�����ṹ�������ǡ�Dd+�š�������ṹ���ᱻ����Ϊ��DV+��+DO���Ľṹ
          lilei=0
        endi
      endi
    endd
  else
    lilei=0
    do whil lilei=0
      lilei=1
      jlb=int(jiegoushu*rand())+1
      go jlb
      if panduan_2 .and. cs=0 .and. yunjiao<>'   ' .and. allt(limited)<>allt(yunjiao)
        if allt(limited)<>'E'
          lilei=0
        endi
      endi
    endd
  endi

  sele 1
  appe from cpjg for recn()=jlb
*һ�εľ��ʹ���temp_jg1.dbf�ļ���
  
  panduan='a'

endf

sele 2
use
use cpjgd
zap
sele 3
use temp_jg2

for ii=1 to duanshu

  sele 3
  zap
  appe from temp_jg1

  for k=1 to hangshu

    panduan_2=.F.
    if int(hangshu/2)=hangshu/2
      panduan_2=(ii=1 .or. int(ii/2)=ii/2)
    else
      panduan_2=(int((ii+1)/2)=(ii+1)/2)
    endi

    loop_end=2
  
    do whil loop_end=1 .or. loop_end=2

      sele 3
      go k
      place_s=1
      place_o=1
      j=''
      for i=1 to 27
*ѭ��������cpjg.dbf�ļ��еĽṹ�ֶ����йأ�����Ķ��˽ṹ�ֶ���������Ҳ��ı�
        if i<10
          zd='J'+str(i,1)
        else
          zd='J'+str(i,2)
        endi
        jgb=&zd.
        j=j+jgb
      endf
      j=rtri(j)
      intneedb=intneed
      csb=cs
      punctb=punct

*if loop_end=1
*  susp
*endi

*�����ѭ�����������ӵ�̾�ʡ�intneedb�������Ƿ�������̾�ʣ�ֵΪ0����ӣ�ֵΪ2����ӣ�ֵΪ1�����ɲ���
      if loop_end=2
        sele 3
        go k
        do case
          case intneedb=2
            repl J1 with "TT"
            repl J2 with "��"
            place_o=3
            if csb<>0
              csb=csb+2
            endi
          case intneedb=1
            gailv=rand()
            if fengge="Y"
              limit=0.9
            else
              limit=0.5
            endi
            if gailv>limit
              repl J1 with "TT"
              repl J2 with "��"
              place_o=3
              if csb<>0
                csb=csb+2
              endi
            endi
          othe
        endc
      endi
  
      loop_end=0

*�����ѭ����ʼ��չԭʼ����
      do whil place_s*2<=len(j)

        tempzd=subs(j,place_s*2-1,2)

        if place_s*2<=len(j)-2
          tempzd2=subs(j,place_s*2+1,2)
        endi

        if place_s*2<=len(j)-4
          tempzd3=subs(j,place_s*2+3,2)
        endi

        zd='J'+allt(str(place_o,2))
        zd1='J'+allt(str(place_o+1,2))
        zd2='J'+allt(str(place_o+2,2))
        zd3='J'+allt(str(place_o+3,2))

        do case
          case tempzd="Mm"
*Mm�ṹ�������޶�������ʣ�Ҳ�����Ǵ�һ�����������
            if fengge='Y'
              limit=0.8
            else
              limit=0.5
            endi
            gailv=rand()
            if gailv>limit
              repl &zd. with "XX"
              repl &zd1. with "��"
              repl &zd2. with "MM"
              place_o=place_o+2
              loop_end=1
              if csb<>0
                csb=csb+2
              endi
            else
              repl &zd. with "MM"
            endi

*Mc�ṹ�������޶���ı��������ʣ�Ҳ�����Ǵ�һ������ı���������
          case tempzd="Mc"
            if fengge='Y'
              limit=0.8
            else
              limit=0.5
            endi
            gailv=rand()
            if gailv>limit
              repl &zd. with "XX"
              repl &zd1. with "��"
              repl &zd2. with "MC"
              place_o=place_o+2
              if csb<>0
                csb=csb+2
              endi
              loop_end=1
            else
              repl &zd. with "MC"
            endi

*Mr�ṹ�������޶���ı���������ʣ�Ҳ�����Ǵ�һ������ı����������
          case tempzd="Mr"
            if fengge='Y'
              limit=0.8
            else
              limit=0.5
            endi
            gailv=rand()
            if gailv>limit
              repl &zd. with "XX"
              repl &zd1. with "��"
              repl &zd2. with "MR"
              place_o=place_o+2
              if csb<>0
                csb=csb+2
              endi
              loop_end=1
            else
              repl &zd. with "MR"
            endi
            
*XX�ṹ�Ƕ�������ǵ�����һ�����ݴʣ������ǡ����ﶯ��+��+���ʡ��Ľṹ��Ҳ�����ǡ���+�����ﶯ�ʡ��Ľṹ
          case tempzd="XX"
            gailv=rand()
            do case
              case gailv<0.75
                repl &zd. with "XA"
              case gailv>=0.75 .and. gailv<0.9
                repl &zd. with "Dd"
                repl &zd1. with "��"
                place_o=place_o+1
                loop_end=1
                if csb<>0
                  if place_s*2=len(j)
                    exit
                  else
                    csb=csb+1
                  endi
                endi
              case gailv>=0.9 .and. gailv<0.95
                repl &zd. with "��"
                repl &zd1. with "DJ"
                place_o=place_o+1
                if csb<>0
                  csb=csb+1
                endi
                loop_end=1
              case gailv>=0.95
                repl &zd. with "DJ"
                repl &zd1. with "��"
                repl &zd2. with "MM"
                place_o=place_o+2
                if csb<>0
                  csb=csb+2
                endi
              othe
            endc
            
*DB�ṹ��ν������Ǽ��ﶯ��+����Ľṹ��Ҳ�����ǲ����ﶯ��
          case tempzd="DB"
            gailv=rand()
            if gailv>0.5
              repl &zd. with "DD"
            else
              repl &zd. with "DJ"
              repl &zd1. with "Mm"
              place_o=place_o+1
              if csb<>0
                csb=csb+1
              endi
              loop_end=1
            endi

*Dd+"��"�ṹ������ʱ��ν������Ǽ��ﶯ��+"��"+���ʵĽṹ��Ҳ�����ǲ����ﶯ��+"��"�Ľṹ
          case tempzd="Dd" .and. tempzd2="��"
            gailv=rand()
            withoutde=panduan_2 .and. yunjiao<>'   ' .and. place_s*2+2=len(j)
            withde=panduan_2 .and. yunjiao<>'   ' .and. place_s*2+4=len(j) .and. tempzd3="��"
            if gailv>0.8 .and. (.not. withoutde) .and. (.not. withde)
              repl &zd. with "DI"
            else
              repl &zd. with "DV"
              repl &zd1. with "��"
              repl &zd2. with "DO"
              if csb<>0
*? withde, withoutde, place_s, csb, j,len(j),place_s*2
                if withoutde .or. withde
                  place_o=place_o+2
                  place_s=place_s+1
                  if withde
                    csb=csb-1
                  endi
                  exit
                else
                  csb=csb+1
                endi
              endi
              place_o=place_o+2
              place_s=place_s+1
            endi

*Dd+"��"�ṹ��һ�������ʽ��������"��"+����+���ﶯ��+"��"�Ľṹ��Ҳ�����ǲ����ﶯ��+"��"�Ľṹ
          case tempzd="Dd" .and. tempzd2="��"
            gailv=rand()
            if gailv>0.8
              repl &zd. with "DI"
            else
              repl &zd. with "��"
              repl &zd1. with "DO"
              repl &zd2. with "DV"
              repl &zd3. with "��"
              place_o=place_o+3
              place_s=place_s+1
              if csb<>0
                csb=csb+2
              endi
            endi

          othe
            repl &zd. with tempzd
        endc
        place_s=place_s+1
        place_o=place_o+1

      endd
      
      repl cs with csb, punct with punctb
    
    endd
    
    sele 3
    go k
    j=''
    for i=1 to 27
      zd='J'+allt(str(i,2))
      jgb=&zd.
      j=j+jgb
    endf
    j=rtri(j)
    csb=cs
    
    sele 2
    appe blan
    for i=1 to 27
      zd='J'+allt(str(i,2))
      repl &zd. with subs(j,i*2-1,2)
    endf
    repl cs with csb, punct with punctb
    
  endf

  if ii<>duanshu
    appe blan
  endi

endf

use

*canc
retu
