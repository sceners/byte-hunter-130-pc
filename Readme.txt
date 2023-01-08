ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³                                                                              ³
³                 B ú Y ú T ú E ú    ú H ú U ú N ú T ú E ú R ú                 ³
³                                                                         v1.3 ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
                           
                                by THE_q and Nop
      


                         iNTRODUCTiON.................1

                         PROGS........................2

                         HiSTORY......................3

                         CREDiTS......................4




ÚÄÄÄÄ[ iNTRODUCTiON ]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ 
³
³
³ ş There is more and more program with frequent updates, that mean that
³   when u cracked 1.1, the 1.2 will be out in few days.. Isn't that some
³   lose of time?
³                  
³   So the idea is, instead bytepatch particular offset, to look for a string
³   and replace it with another..
³   There is not so much sources of progs like this, and most of them are 
³   slow.. really slow (TurboPascal suxx sometimes ;)
³
³ ş So, we (Nop & THE_q) decided to code one, THE_q do the main work, and i
³   added some improvements, and THE_q finally improved all :)
³
³ ş U are allowed to use this sourcecode and all components freely, we only
³   ask that u let the "ByteHunter by Nop and THE_q" in the file... 
³
³ ş It's one of the fastest Search & Replace procedure i ever see, and i 
³   think u will be happy to use it.. so take care of it :)
³
³ ş I (Nop) want to dedicated this prog to Riz la+ that was looking for one
³   and give me the idea of all this.
³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ÚÄÄÄÄ[ PROGS ]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
³
³ ş Package:
³
³    FILE_ID.DIZ
³    PC.NFO                               Phrozen Crew Nfo
³    README.TXT                           Main doc
³
³    \SOURCE\BYTEH.ASM                    Source of the prog
³    \SOURCE\A86.COM                      Compiler
³    \SOURCE\COMPILE.BAT                  just launch that to compile ;)
³
³    \BH_FILL\BH_FILL.EXE                 easy way to fill ur infos
³    \BH_FILL\BH_FSRC.ZIP                 SourceCode of this prog (Pascal)
³
³
³ ş To make a compilable file, there is 3 steps:
³    - put infos for title, example:
³
³      text_title db ' FtpVoyager v5.x.x.x crack by Nop'        ,0Dh,0ah
³                 db 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ-- -',0Dh,0ah,'$'
³
³    - Put others infos (filename, string to search, string to put), example:
³
³      FileName1  db 'FTPVOY~1.EXE',0
³
³      S2FIND1    db  3                      <--number or bytes to find
³                 db  00Fh,09Ch,0C0h         <--bytes
³
³      S2PUT1     db  3                      <--number of bytes to put
³                 db  066h,033h,0C0h         <--bytes
³
³      In the string to find, if the byte is equal to '?' (3fh) then it isn't
³      checked.
³
³Û   Remember this:
³Û    First byte=Number of bytes
³Û    Then all bytes to use
³Û    '?' = Any byte
³
³
³   - Then go to the end of the prog to the main prog part (at the end), and
³     put after the
³              ; ş ENTER REF HERE:
³
³      all your references like this:
³                     mov ax,offset S2FIND1
³                     mov bx,offset S2PUT1
³                     lea dx,filename1
³                   call goforit
³
³
³Û   Remember this: 
³Û     AX = STRING TO FIND
³Û     BX = STRING TO PUT
³Û     DX = FILENAME
³
³
³      If you have other string to search, other file to modify, add it just
³      after.
³
³ ş To compile simply use dosCommandLine "A86.COM BYTEH.ASM" and u will obtain
³   a byteh.com ready to work... and if you are as lazy as me, just launch
³   the COMPILE.BAT ;)
³
³ ş And for people more lazy than me, THE_q made a tools, BH_FILL that
³   will ask for all these infos.
³   - Launch BH_FILL.EXE and just put what the prog ask :)
³
³   Note: u will not have to enter number of byte
³
³   the \BH_FILL\BH_FSRC.ZIP contain sourcecode of BH_FILL if u want to change
³   some things.   
³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ÚÄÄÄÄ[ HiSTORY ]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
³
³  v1.0: Search & replace procedure by THE_q
³  v1.1: comments, multistring and multifiles habilities added by Nop
³  v1.2: BH_FILL added by THE_q
³
³  *FIRST PUBLiC RELEASE*
³  v1.3: doc wrote by Nop, latest fix by THE_q
³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ÚÄÄÄÄ[ CREDiTS ]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
³
³  GROUP GREETS: BS/CORE/GLOW/REVOLT/UCF/X-FORCE
³
³  PERSONAL GREETS
³    FROM NOP: |mb|, madmax, G-RoM, tHATDUDE, aDancer, Rizla+, hackerjack,
³              Blitz, Random, Baloosh, MiRaMaX, RudeBoy, Teraphy, Klink,
³              STaRDoGG CHaMP, taylor^ (comment ca va cheri? ;), Hetero, tKC,
³              t00nie, Killer+Bee, DaBaptist, Celestial, DaVinci, Superchic,
³              THE_q, and everyone in #PC98... oh yes.. they are all good!!
³
³  FROM THE_Q: nOP,tKC,Archimede,DaVinci,Antha,Taylor,aDancer,Riz|a,RudeBoy,
³              RayF00,TUC,Zarkman,Klink,Genesis,NiTR8^,Plushmm,t00nie,Saga,
³              Byte-Ripper, and EveryOne on #pc98 that help PC to be the
³              Number #1 CrAcKiNg group ! ;)
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
