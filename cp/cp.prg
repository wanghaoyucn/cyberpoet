*2004��3��2���𣬱��������¿�ʼ����
*����˵����variable.txt�ļ�

set defa to .
publ jgb,dmb,lgb1,c
yl_status=.F.
set talk off
set safe off
set exac on
clos data
*use cp1
*zap
clea
? "���������������Ժ�..."
clea

*��ʾ��ͷ
text
�աաաաաաաաաաաաաաաաաաաաաաաա�

�������ɣ�
endt
ageyear=year(date())-2002
agemonth=mont(date())-4
ageday=day(date())-4
do case
  case ageyear<>0
    ? ageyear,'��ļ����ʫ�˻���Ϊ���質��'
  case ageyear=0 .and. agemonth<>0
    ? agemonth,'���´�ļ����ʫ�˻���Ϊ���質��'
  othe
    ? ageday,'���ļ����ʫ�˻���Ϊ���質��'
endc
text
������������������������������������Version 1.21c
���գ�2002��4��4�ա�������������������������������
������������������������������������ԭ������������
���᣺ɽ��ƽ�����ӹء����������������ıࣺ���㩦
���ã�дʫ����������������������������������������
����������������������������������2004��3��5��

�աաաաաաաաաաաաաաաաաաաաաաաա�
endt
*��ͷ��ʾ����

wait

quit_cp='Y'
do whil uppe(quit_cp)='Y'

  set proc to proc_2
  ? '�������������ݣ���ʹ�ҵĴ��������е���ݣ�'
  wait "��Ҫ�����ķ���𣿣���֮���Ǳ��ŵķ��[Y/N]" to fengge
  fengge=uppe(fengge)

  inpu "�ֶ��ٶΣ����������֣�����1Ϊ���ֶΣ���" to dsb
  if dsb=1
    inpu '�������������е�ʫ�أ����������֣���' to hsb
  else
    inpu "ÿ�ζ����У����������֣���" to hsb
  endi

  wait '��ҪѺ������ò�Ҫ����ΪѺ�Ϻ���л��ܵ�һ��������[Y/N]��' to yl
  yl=uppe(yl)

  if yl<>'Y'
    yjb=''
    do create_structure with dsb,hsb,fengge,yjb
    do cpzh
  else
    clea
    ? '�������Ͻ�(v����, r����֪���ԡ�ʫ���յ���ĸ, z�����ʡ��ơ�˼����ĸ)'
    acce '[ѡ������֮һ��a, ai, an, ang, ao, e(o,uo), ei(ui), en(in,un,vn), eng(ing), er, i, ie(ve), ong, ou(iu), r(z), u, v]'  to yjb
    yjb=lowe(allt(yjb))
    do case
      case yjb='o' .or. yjb='uo'
        yjb='e'
      case yjb='ui'
        yjb='ei'
      case yjb='in' .or. yjb='un' .or. yjb='vn'
        yjb='en'
      case yjb='ing'
        yjb='eng'
      case yjb='ve'
        yjb='ie'
      case yjb='iu'
        yjb='ou'
      case yjb='z'
        yjb='r'
      othe
    endc
    do create_structure with dsb,hsb,fengge,yjb
    do cpzhy
  endi

  ? chr(7)
  wait 'ʫ��ȫ��д���ˣ������Ͱɣ����������������'
  clea
  sele 1
  use cp
  coun to hang
  for i=1 to hang
    go i
    poemtrim=rtri(poem)
*rtri������ɾ���ַ���ĩβ�Ŀո�
    if int((i-1)/30)=(i-1)/30 .and. i<>1
      @row(),0
      @row(),2 say poemtrim
    else
      ? "  "+poemtrim
    endi
    if int(i/30)=i/30
      wait
    endi
  endf

  ?
  wait '������[Y/N]' to x
  clea
  if uppe(x)='Y'
    acce '����⣺' to tm
    ? '�ã��ҽ������������Թ��Ժ����͡���'
    sele 2
    use cpcs
    poemnumber=allt(str(poemnum))
    for i=1 to 6-len(poemnumber)
      poemnumber='0'+poemnumber
    endf
    poemfilename='cp'+poemnumber+'.txt'
    enter=chr(13)+chr(10)
    fp=fcre('&poemfilename.')
    =fwri(fp,'**************************************'+enter)
    =fwri(fp,tm+enter)
    =fwri(fp,'����Ʒ��'+poemnumber+'�ţ�'+enter)
    =fwri(fp,'**************************************'+enter)
    sele 1
    for i=1 to hang
      go i
      poemtrim=rtri(poem)
      =fwri(fp,poemtrim+enter)
    endf
    =fclo(fp)
    sele 2
    repl poemnum with poemnum+1
  else
    ? '�������ҾͰ����ӵ�ֽ¨���ˣ�'
  endi
  wait
  clea
  wait '����һ����Σ�û��ϵ�����Ѿ����ģ�[Y/N]' to quit_cp

endd

?
? '��ô������ЪЪ�ȿ�ˮ����'
clos data
retu
