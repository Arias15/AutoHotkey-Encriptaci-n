;https://github.com/aviaryan/autohotkey-scripts/blob/master/Functions/Encrypt.ahk
;https://www.google.com/search?rlz=1C1CHBF_esPE862PE862&ei=kPFYXYvkBuey5OUP3-GEkAo&q=+encrypt+with+autohotkey&oq=+encrypt+with+autohotkey&gs_l=psy-ab.3..0i22i30l2.12540.12540..13293...0.3..0.132.132.0j1......0....2j1..gws-wiz.......0i71.JCNaPXTkkqg&ved=0ahUKEwiL7NTf5ovkAhVnGbkGHd8wAaIQ4dUDCAo&uact=5

; ===================================================================================
; AHK Version ...: AHK_L 1.1.11.01 x64 Unicode
; Win Version ...: Windows 7 Professional x64 SP1
; Author ........: jNizM
; Script ........: EnCrypt_DeCrypt.ahk
; Description ...: Encrypt & Decrypt Data
; License .......: WTFPL
; ===================================================================================

; GLOBAL SETTINGS ===================================================================

#NoEnv
#SingleInstance force

#Include Crypt.ahk
#Include CryptConst.ahk
#Include CryptFoos.ahk

; SCRIPT ============================================================================

Gui, Margin, 10, 10
Gui, Font, s10, Tahoma

Gui, Add, Edit, xm ym w300 h120 vStr, En-/DeCrypt
Gui, Add, Edit, xm y+5 w300 vStr2, Password
Gui, Add, Edit, xm y+10 w300 h120 vEnDeCrypt ReadOnly
Gui, Add, DropDownList, xm y+5 w300 AltSubmit vEncryption, RC4 (Rivest Cipher)
    |RC2 (Rivest Cipher)
    |3DES (Data Encryption Standard)
    |3DES 112 (Data Encryption Standard)
    |AES 128 (Advanced Encryption Standard)
    |AES 192 (Advanced Encryption Standard)
    |AES 256 (Advanced Encryption Standard)||
Gui, Add, Button, xm-1 y+5 w100, Encrypt
Gui, Add, Button, xm+201 yp w100, Decrypt

Gui, Show,, En-/DeCrypt
Return

ButtonEncrypt:
    Gui, Submit, NoHide
    GuiControl,, EnDeCrypt, % Crypt.Encrypt.StrEncrypt(Str, Str2, Encryption, 1)
Return

ButtonDecrypt:
    Gui, Submit, NoHide
    GuiControl,, EnDeCrypt, % Crypt.Encrypt.StrDecrypt(Str, Str2, Encryption, 1)
Return

; EXIT ==============================================================================

GuiClose:
GuiEscape:
ExitApp