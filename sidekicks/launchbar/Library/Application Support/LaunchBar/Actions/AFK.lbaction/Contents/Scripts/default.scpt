FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l     �� 	 
��   	   Start Screen Saver    
 �   &   S t a r t   S c r e e n   S a v e r      l     ��  ��      LaunchBar Action     �   "   L a u n c h B a r   A c t i o n      l     ��  ��      default.scpt     �      d e f a u l t . s c p t      l     ��  ��     
 Version 3     �      V e r s i o n   3      l     ��������  ��  ��        l     ��   ��    4 . Copyright (c) 2008-2016 Objective Development      � ! ! \   C o p y r i g h t   ( c )   2 0 0 8 - 2 0 1 6   O b j e c t i v e   D e v e l o p m e n t   " # " l     �� $ %��   $   https://obdev.at/    % � & & $   h t t p s : / / o b d e v . a t / #  ' ( ' l     ��������  ��  ��   (  ) * ) l     +���� + I    �� ,��
�� .sysoexecTEXT���     TEXT , m      - - � . .� 
 i f   [   - e   / S y s t e m / L i b r a r y / F r a m e w o r k s / S c r e e n S a v e r . f r a m e w o r k / V e r s i o n s / A / R e s o u r c e s / S c r e e n S a v e r E n g i n e . a p p   ] ;   t h e n 
 	 o p e n   / S y s t e m / L i b r a r y / F r a m e w o r k s / S c r e e n S a v e r . f r a m e w o r k / V e r s i o n s / A / R e s o u r c e s / S c r e e n S a v e r E n g i n e . a p p 
 e l s e 
 	 o p e n   - a   S c r e e n S a v e r E n g i n e 
 f i 
��  ��  ��   *  / 0 / l     �� 1 2��   1 g a open -a ScreenSaverEngine fails if ScreenSaverEngine isn't registered in LaunchServices database    2 � 3 3 �   o p e n   - a   S c r e e n S a v e r E n g i n e   f a i l s   i f   S c r e e n S a v e r E n g i n e   i s n ' t   r e g i s t e r e d   i n   L a u n c h S e r v i c e s   d a t a b a s e 0  4 5 4 l     �� 6 7��   6 N H Therefore we first check if it's possible to open it from its full path    7 � 8 8 �   T h e r e f o r e   w e   f i r s t   c h e c k   i f   i t ' s   p o s s i b l e   t o   o p e n   i t   f r o m   i t s   f u l l   p a t h 5  9�� 9 l     ��������  ��  ��  ��       �� : ;��   : ��
�� .aevtoappnull  �   � **** ; �� <���� = >��
�� .aevtoappnull  �   � **** < k      ? ?  )����  ��  ��   =   >  -��
�� .sysoexecTEXT���     TEXT�� �j  ascr  ��ޭ