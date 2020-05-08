#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%
AutoTrim, off
Menu, Tray, Tip, AutoTexto
Menu, Tray, NoStandard
Menu, Tray, Add, Sair, Fechar
Menu, Tray, Add, Programar, Programar
Menu, Tray, Default, Programar
Key:= jEnnyRIdeaL2966478273H ;THIS KEY ENCRYPT PASS and PASS ENCRYPT TEXTS
Senha= 0
ERR= 0

IniRead, PASS, Autotexto.ini, Conf, PASS
IniRead, TIMER, Autotexto.ini, Conf, TIMER
IniRead, LAST, Autotexto.ini, Conf, LAST
if (PASS = "ERROR")
{
	PASS=
	Encriptado:= XOR_String_Plus(PASS, Key)
	IniWrite, %Encriptado%, Autotexto.ini, Conf, PASS
}
else
	PASS:= XOR_String_Minus(PASS, Key)
if (TIMER = "ERROR")
	TIMER= 30
if (LAST = "ERROR")
	LAST= 0

IniWrite, %TIMER%, Autotexto.ini, Conf, TIMER
IniWrite, %LAST%, Autotexto.ini, Conf, LAST

Loop, 4
{
	IniRead, Periodo%A_Index%, Autotexto.ini, Texts, Periodo%A_Index%
	if (Periodo%A_Index% = "ERROR")
	{
		Periodo%A_Index%= Periodo %A_Index%
		Encriptado:= XOR_String_Plus(Periodo%A_Index%, PASS)
		IniWrite, %Encriptado%, Autotexto.ini, Texts, Periodo%A_Index%
	}
	else
		Periodo%A_Index%:= XOR_String_Minus(Periodo%A_Index%, PASS)
}

Loop, 9
{
	IniRead, TXT%A_Index%, Autotexto.ini, Texts, TXT%A_Index%
	IniRead, Prefix%A_Index%, Autotexto.ini, Prefix, %A_Index%
	IniRead, Autosend%A_Index%, Autotexto.ini, Autosend, %A_Index%
	if (TXT%A_Index% = "ERROR")
	{
		TXT%A_Index%= Exemplo de texto %A_Index%
		Encriptado:= XOR_String_Plus(TXT%A_Index%, PASS)
		IniWrite, %Encriptado%, Autotexto.ini, Texts, TXT%A_Index%
	}
	else
		TXT%A_Index%:= XOR_String_Minus(TXT%A_Index%, PASS)
	if (Prefix%A_Index% = "ERROR")
		Prefix%A_Index%= 0
	if (Autosend%A_Index% = "ERROR")
		Autosend%A_Index%= 0
	IniWrite, % Prefix%A_Index%, Autotexto.ini, Prefix, %A_Index%
	IniWrite, % Autosend%A_Index%, Autotexto.ini, Autosend, %A_Index%
}
return

^F1::
KeyWait F1
TXTSelect= 1
gosub EnviarTXT
return
^F2::
KeyWait F2
TXTSelect= 2
gosub EnviarTXT
return
^F3::
KeyWait F3
TXTSelect= 3
gosub EnviarTXT
return
^F4::
KeyWait F4
TXTSelect= 4
gosub EnviarTXT
return
^F5::
KeyWait F5
TXTSelect= 5
gosub EnviarTXT
return
^F6::
KeyWait F6
TXTSelect= 6
gosub EnviarTXT
return
^F7::
KeyWait F7
TXTSelect= 7
gosub EnviarTXT
return
^F8::
KeyWait F8
TXTSelect= 8
gosub EnviarTXT
return
^F9::
KeyWait F9
TXTSelect= 9
gosub EnviarTXT
return

EnviarTXT:
KeyWait Control
gosub Senha
if (Senha= 0)
	return
if (Prefix%TXTSelect% = 1)
	gosub Prefixo
Send % TXT%TXTSelect%
if (Autosend%TXTSelect% = 1)
	Send {ENTER}
else
	Send {Space}
gosub Last
return
Prefixo:
If(A_hour < 5)
	Send, %Periodo4%{Space}
else if (A_hour >=5 && A_Hour < 12)
	Send, %Periodo1%{Space}
else if (A_hour >=12 && A_Hour < 18)
	Send, %Periodo2%{Space}
else
	Send, %Periodo3%{Space}
return

Programar:
gosub Senha
if (Senha= 0)
	return
Suspend, On
menu, tray, DeleteAll
Menu, Tray, Tip, AutoTexto
Menu, Tray, NoStandard
Menu, Tray, Add, Sair, Fechar
Gui, 1:Destroy
Gui 1:-0x400000 +ToolWindow +AlwaysOnTop
Gui, 1:Color, 5050FF, FFFFFF
Gui, 1:Font, s10 c000000 Bold
Gui, 1:add, text, y10, PREFIXO DE MANHÃ:
Gui, 1:add, edit, w300 r1 vPeriodo1, %Periodo1%
Gui, 1:add, text,, PREFIXO DE TARDE:
Gui, 1:add, edit, w300 r1 vPeriodo2, %Periodo2%
Gui, 1:add, Checkbox, vPrefix1 Checked%Prefix1%, INCLUIR PREFIXO - TEXTO F1:
Gui, 1:add, edit, w1340 r2 vTXT1, %TXT1%
Gui, 1:add, Checkbox, vPrefix2 Checked%Prefix2%, INCLUIR PREFIXO - TEXTO F2:
Gui, 1:add, edit, w1340 r2 vTXT2, %TXT2%
Gui, 1:add, Checkbox, vPrefix3 Checked%Prefix3%, INCLUIR PREFIXO - TEXTO F3:
Gui, 1:add, edit, w1340 r2 vTXT3, %TXT3%
Gui, 1:add, Checkbox, vPrefix4 Checked%Prefix4%, INCLUIR PREFIXO - TEXTO F4:
Gui, 1:add, edit, w1340 r2 vTXT4, %TXT4%
Gui, 1:add, Checkbox, vPrefix5 Checked%Prefix5%, INCLUIR PREFIXO - TEXTO F5:
Gui, 1:add, edit, w1340 r2 vTXT5, %TXT5%
Gui, 1:add, Checkbox, vPrefix6 Checked%Prefix6%, INCLUIR PREFIXO - TEXTO F6:
Gui, 1:add, edit, w1340 r2 vTXT6, %TXT6%
Gui, 1:add, Checkbox, vPrefix7 Checked%Prefix7%, INCLUIR PREFIXO - TEXTO F7:
Gui, 1:add, edit, w1340 r2 vTXT7, %TXT7%
Gui, 1:add, Checkbox, vPrefix8 Checked%Prefix8%, INCLUIR PREFIXO - TEXTO F8:
Gui, 1:add, edit, w1340 r2 vTXT8, %TXT8%
Gui, 1:add, Checkbox, vPrefix9 Checked%Prefix9%, INCLUIR PREFIXO - TEXTO F9:
Gui, 1:add, edit, w1340 r2 vTXT9, %TXT9%
Gui, 1:add, Checkbox, x350 y120 vAutosend1 Checked%Autosend1%, AUTOSEND TEXTO F1
Gui, 1:add, Checkbox, x350 y190 vAutosend2 Checked%Autosend2%, AUTOSEND TEXTO F2
Gui, 1:add, Checkbox, x350 y260 vAutosend3 Checked%Autosend3%, AUTOSEND TEXTO F3
Gui, 1:add, Checkbox, x350 y330 vAutosend4 Checked%Autosend4%, AUTOSEND TEXTO F4
Gui, 1:add, Checkbox, x350 y400 vAutosend5 Checked%Autosend5%, AUTOSEND TEXTO F5
Gui, 1:add, Checkbox, x350 y470 vAutosend6 Checked%Autosend6%, AUTOSEND TEXTO F6
Gui, 1:add, Checkbox, x350 y540 vAutosend7 Checked%Autosend7%, AUTOSEND TEXTO F7
Gui, 1:add, Checkbox, x350 y610 vAutosend8 Checked%Autosend8%, AUTOSEND TEXTO F8
Gui, 1:add, Checkbox, x350 y680 vAutosend9 Checked%Autosend9%, AUTOSEND TEXTO F9
Gui, 1:add, text, x350 y10, PREFIXO DE NOITE:
Gui, 1:add, edit, w300 r1 vPeriodo3, %Periodo3%
Gui, 1:add, text,, PREFIXO DE MADRUGADA:
Gui, 1:add, edit, w300 r1 vPeriodo4, %Periodo4%
Gui, 1:add, text, x750 y10, PASSWORD:
Gui, 1:add, edit, w100 r1 vPASS Limit, %PASS%
Gui, 1:add, text,, BLOQ.(MINUTOS):
Gui, 1:add, edit, w100 r1 vTIMER Limit3 Number, %TIMER%
Gui, 1:Add, Checkbox, x750 y117 vLAST Checked%LAST%, REINICIAR TEMPO DE BLOQUEIO APÓS CADA ENVIO
Gui, 1:add, Button, Default x930 y22 w200 h80 gOKButton, Salvar Edições
Gui, 1:add, Button, x1150 y22 w200 h38 gCancelButton, Cancelar Edições
Gui, 1:add, Button, x1150 y64 w200 h38 gBloqButton, Cancelar e Bloquear
Gui, 1:add, text, x20 y750, %ERR% ERRO(S) DE PASSWORD - AUTOTEXTO - PROGAMADO POR RAFAEL COSTA (2015) - AUTOHOTKEY SCRIPT - VERSÃO BETA - PASSWORD NÃO É TOTALMENTE SEGURO!
Gui, 1:Show, x0 y0 w1366 h768, Programar
ERR= 0
return

OKButton:
Gui, 1:Submit
Gui, 1:Destroy
if (TIMER< 1)
	TIMER= 1
if (TIMER> 240)
	TIMER= 240
Loop, 9
{
	Encriptado:= XOR_String_Plus(TXT%A_Index%, PASS)
	IniWrite, %Encriptado%, Autotexto.ini, Texts, TXT%A_Index%
	IniWrite, % Prefix%A_Index%, Autotexto.ini, Prefix, %A_Index%
	IniWrite, % Autosend%A_Index%, Autotexto.ini, Autosend, %A_Index%
}
Loop, 4
{
	Encriptado:= XOR_String_Plus(Periodo%A_Index%, PASS)
	IniWrite, %Encriptado%, Autotexto.ini, Texts, Periodo%A_Index%
}
Encriptado:= XOR_String_Plus(PASS, Key)
IniWrite, %Encriptado%, Autotexto.ini, Conf, PASS
IniWrite, %TIMER%, Autotexto.ini, Conf, TIMER
IniWrite, %LAST%, Autotexto.ini, Conf, LAST
Suspend, Off
TimerOver:= TIMER* 60000
SetTimer, TimerOver,  %TimerOver%
menu, tray, DeleteAll
Menu, Tray, Tip, AutoTexto
Menu, Tray, NoStandard
Menu, Tray, Add, Sair, Fechar
Menu, Tray, Add, Programar, Programar
Menu, Tray, Default, Programar
return

CancelButton:
Gui, 1:Cancel
Gui, 1:Destroy
Suspend, Off
menu, tray, DeleteAll
Menu, Tray, Tip, AutoTexto
Menu, Tray, NoStandard
Menu, Tray, Add, Sair, Fechar
Menu, Tray, Add, Programar, Programar
Menu, Tray, Default, Programar
return

BloqButton:
Gui, 1:Cancel
Gui, 1:Destroy
Suspend, Off
menu, tray, DeleteAll
Menu, Tray, Tip, AutoTexto
Menu, Tray, NoStandard
Menu, Tray, Add, Sair, Fechar
Menu, Tray, Add, Programar, Programar
Menu, Tray, Default, Programar
Senha= 0
return

Senha:
if (Senha= 1)
	return
Suspend, On
Senha= 2
menu, tray, DeleteAll
Menu, Tray, Tip, AutoTexto
Menu, Tray, NoStandard
Menu, Tray, Add, Sair, Fechar
Gui, 1:Destroy
Gui 1:-0x400000 +ToolWindow +AlwaysOnTop
Gui, 1:Color, 0000FF, FFFFFF
Gui, 1:Font, s10 c000000 Bold
if not PASS
	Gui, 1:add, text, w100 Center, CRIAR NOVO`nPASSWORD:
else
	Gui, 1:add, text, w100 Center, PASSWORD:
Gui, 1:add, edit, w100 vPassin gPassin Limit Password,
Gui, 1:add, Button, w100 h25 Default gEntrar, OK
Gui, 1:Show,, Password
EsperaSenha:
if Senha= 2
	goto EsperaSenha
return
Passin:
GuiControlGet, Passin,, Passin
if (Passin = PASS)
	if PASS
		gosub Entrar
return
Entrar:
Gui, 1:Submit
Gui, 1:Destroy
Suspend, Off
menu, tray, DeleteAll
Menu, Tray, Tip, AutoTexto
Menu, Tray, NoStandard
Menu, Tray, Add, Sair, Fechar
Menu, Tray, Add, Programar, Programar
Menu, Tray, Default, Programar
if not PASS
{
	PASS:= Passin
	Loop, 9
	{
		Encriptado:= XOR_String_Plus(TXT%A_Index%, PASS)
		IniWrite, %Encriptado%, Autotexto.ini, Texts, TXT%A_Index%
	}
	Loop, 4
	{
		Encriptado:= XOR_String_Plus(Periodo%A_Index%, PASS)
		IniWrite, %Encriptado%, Autotexto.ini, Texts, Periodo%A_Index%
	}
	Encriptado:= XOR_String_Plus(PASS, Key)
	IniWrite, %Encriptado%, Autotexto.ini, Conf, PASS
}
if (Passin <> PASS)
{
	Senha= 0
	ERR:= ERR + 1
	return
}
Senha= 1
TimerOver:= TIMER* 60000
SetTimer, TimerOver,  %TimerOver%
return

Last:
if (LAST= 1)
{
	TimerOver:= TIMER* 60000
	SetTimer, TimerOver,  %TimerOver%
}
return

TimerOver:
Senha= 0
SetTimer, TimerOver, Off
return

Fechar:
ExitApp

XOR_String_Plus(String,Key)
{
	Key_Pos := 1
	Loop, Parse, String
	{
		String_XOR .= Chr((Asc(A_LoopField) ^ Asc(SubStr(Key,Key_Pos,1))) + 15000)
		Key_Pos += 1
		if (Key_Pos > StrLen(Key))
			Key_Pos := 1
	}
	return String_XOR
}

XOR_String_Minus(String,Key)
{
	Key_Pos := 1
	Loop, Parse, String
	{
		String_XOR .= Chr(((Asc(A_LoopField) - 15000) ^ Asc(SubStr(Key,Key_Pos,1))))
		Key_Pos += 1
		if (Key_Pos > StrLen(Key))
			Key_Pos := 1
	}
	return String_XOR
}