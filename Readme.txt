������������������������������������������������������������������������������Ŀ
�                                                                              �
�                 B � Y � T � E �    � H � U � N � T � E � R �                 �
�                                                                         v1.3 �
��������������������������������������������������������������������������������
                           
                                by THE_q and Nop
      


                         iNTRODUCTiON.................1

                         PROGS........................2

                         HiSTORY......................3

                         CREDiTS......................4




�����[ iNTRODUCTiON ]��������������������������������������������������������� 
�
�
� � There is more and more program with frequent updates, that mean that
�   when u cracked 1.1, the 1.2 will be out in few days.. Isn't that some
�   lose of time?
�                  
�   So the idea is, instead bytepatch particular offset, to look for a string
�   and replace it with another..
�   There is not so much sources of progs like this, and most of them are 
�   slow.. really slow (TurboPascal suxx sometimes ;)
�
� � So, we (Nop & THE_q) decided to code one, THE_q do the main work, and i
�   added some improvements, and THE_q finally improved all :)
�
� � U are allowed to use this sourcecode and all components freely, we only
�   ask that u let the "ByteHunter by Nop and THE_q" in the file... 
�
� � It's one of the fastest Search & Replace procedure i ever see, and i 
�   think u will be happy to use it.. so take care of it :)
�
� � I (Nop) want to dedicated this prog to Riz la+ that was looking for one
�   and give me the idea of all this.
�
�����������������������������������������������������������������������������Ŀ
�����[ PROGS ]�����������������������������������������������������������������
�
� � Package:
�
�    FILE_ID.DIZ
�    PC.NFO                               Phrozen Crew Nfo
�    README.TXT                           Main doc
�
�    \SOURCE\BYTEH.ASM                    Source of the prog
�    \SOURCE\A86.COM                      Compiler
�    \SOURCE\COMPILE.BAT                  just launch that to compile ;)
�
�    \BH_FILL\BH_FILL.EXE                 easy way to fill ur infos
�    \BH_FILL\BH_FSRC.ZIP                 SourceCode of this prog (Pascal)
�
�
� � To make a compilable file, there is 3 steps:
�    - put infos for title, example:
�
�      text_title db ' FtpVoyager v5.x.x.x crack by Nop'        ,0Dh,0ah
�                 db '�������������������������������������-- -',0Dh,0ah,'$'
�
�    - Put others infos (filename, string to search, string to put), example:
�
�      FileName1  db 'FTPVOY~1.EXE',0
�
�      S2FIND1    db  3                      <--number or bytes to find
�                 db  00Fh,09Ch,0C0h         <--bytes
�
�      S2PUT1     db  3                      <--number of bytes to put
�                 db  066h,033h,0C0h         <--bytes
�
�      In the string to find, if the byte is equal to '?' (3fh) then it isn't
�      checked.
�
��   Remember this:
��    First byte=Number of bytes
��    Then all bytes to use
��    '?' = Any byte
�
�
�   - Then go to the end of the prog to the main prog part (at the end), and
�     put after the
�              ; � ENTER REF HERE:
�
�      all your references like this:
�                     mov ax,offset S2FIND1
�                     mov bx,offset S2PUT1
�                     lea dx,filename1
�                   call goforit
�
�
��   Remember this: 
��     AX = STRING TO FIND
��     BX = STRING TO PUT
��     DX = FILENAME
�
�
�      If you have other string to search, other file to modify, add it just
�      after.
�
� � To compile simply use dosCommandLine "A86.COM BYTEH.ASM" and u will obtain
�   a byteh.com ready to work... and if you are as lazy as me, just launch
�   the COMPILE.BAT ;)
�
� � And for people more lazy than me, THE_q made a tools, BH_FILL that
�   will ask for all these infos.
�   - Launch BH_FILL.EXE and just put what the prog ask :)
�
�   Note: u will not have to enter number of byte
�
�   the \BH_FILL\BH_FSRC.ZIP contain sourcecode of BH_FILL if u want to change
�   some things.   
�
�����������������������������������������������������������������������������Ŀ
�����[ HiSTORY ]���������������������������������������������������������������
�
�  v1.0: Search & replace procedure by THE_q
�  v1.1: comments, multistring and multifiles habilities added by Nop
�  v1.2: BH_FILL added by THE_q
�
�  *FIRST PUBLiC RELEASE*
�  v1.3: doc wrote by Nop, latest fix by THE_q
�
�����������������������������������������������������������������������������Ŀ
�����[ CREDiTS ]���������������������������������������������������������������
�
�  GROUP GREETS: BS/CORE/GLOW/REVOLT/UCF/X-FORCE
�
�  PERSONAL GREETS
�    FROM NOP: |mb|, madmax, G-RoM, tHATDUDE, aDancer, Rizla+, hackerjack,
�              Blitz, Random, Baloosh, MiRaMaX, RudeBoy, Teraphy, Klink,
�              STaRDoGG CHaMP, taylor^ (comment ca va cheri? ;), Hetero, tKC,
�              t00nie, Killer+Bee, DaBaptist, Celestial, DaVinci, Superchic,
�              THE_q, and everyone in #PC98... oh yes.. they are all good!!
�
�  FROM THE_Q: nOP,tKC,Archimede,DaVinci,Antha,Taylor,aDancer,Riz|a,RudeBoy,
�              RayF00,TUC,Zarkman,Klink,Genesis,NiTR8^,Plushmm,t00nie,Saga,
�              Byte-Ripper, and EveryOne on #pc98 that help PC to be the
�              Number #1 CrAcKiNg group ! ;)
�������������������������������������������������������������������������������
