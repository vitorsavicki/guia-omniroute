# 5️⃣ Autostart no Windows + pegadinhas do sistema

## Subir tudo junto com o Windows

1. Salve o [scripts/iniciar-tudo.bat](../scripts/iniciar-tudo.bat) ajustando os caminhos
2. Aperte `Win+R` → `shell:startup` → Enter
3. Copie o .bat para essa pasta

Pronto: OmniRoute (+ o que mais você quiser) sobem sozinhos a cada login.

Dica: crie também um atalho na Área de Trabalho para subir manualmente quando
precisar. **Atenção:** se sua Área de Trabalho é redirecionada pelo OneDrive,
o caminho real é `C:\Users\VOCE\OneDrive\Área de Trabalho` — descubra o seu com:

```powershell
[Environment]::GetFolderPath("Desktop")
```

## 🕳️ Pegadinhas reais que encontramos

### 1. Dois nodes no PATH
O `node` do PATH pode não ser o que você instalou (alguns apps embutem node).
O OmniRoute exige **22.22.2+**. Verifique:

```powershell
(Get-Command node).Source; node --version
```

Se for um node velho embutido, chame o bom explicitamente ou ajuste a ordem
do PATH.

### 2. Janelas/terminais velhos não herdam variáveis novas
Variável de ambiente gravada agora só vale para processos abertos **depois**.
Feche e reabra. Em último caso, reinicie o Explorer ou faça logoff.

### 3. Desktop que "some"
OneDrive redireciona a Área de Trabalho — arquivos salvos em
`C:\Users\VOCE\Desktop` não aparecem na área de trabalho de verdade.
Use `[Environment]::GetFolderPath("Desktop")` nos scripts.

### 4. npm TAR_ENTRY_ERROR / ENOENT em installs grandes
Caminho longo demais no Windows. Solução: `LongPathsEnabled=1` (ver
[01-instalacao.md](01-instalacao.md)) + tentar de novo.

### 5. O daemon leva ~2 min para ficar saudável depois do boot
Health check dando timeout logo após iniciar é normal — aguarde e teste de novo.


## ✅ Checkpoint

O arquivo .bat está na pasta `shell:startup`. (Teste opcional: reiniciar o PC e ver o health check dar 200 sem você abrir nada.)

Próximo: [06-seguranca.md](06-seguranca.md)
