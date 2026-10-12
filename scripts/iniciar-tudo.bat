@echo off
REM Sobe o OmniRoute (IA gratis) em segundo plano.
REM Ajuste os caminhos para a sua instalacao!
REM Dica: coloque este .bat em shell:startup para autostart.

REM Se o seu node 22.22.2+ nao e o primeiro do PATH, ajuste aqui:
REM set PATH=C:\caminho\para\seu\node;%PATH%

start "OmniRoute" /min cmd /c "omniroute serve --daemon --port 20128 --no-open"
exit
