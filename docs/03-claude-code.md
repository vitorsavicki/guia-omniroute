# 3️⃣ Claude Code + VS Code

## Instalar o Claude Code (via npm — controle total do destino)

```powershell
npm install -g @anthropic-ai/claude-code
# Extensão do VS Code: procure "Claude Code" no marketplace e instale
```

## As 4 variáveis de ambiente (o coração do esquema)

Sem login da Anthropic: o Claude Code conversa com o OmniRoute local.

```powershell
[Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL","http://localhost:20128","User")
[Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN","<SUA_CHAVE_OMNIROUTE>","User")
[Environment]::SetEnvironmentVariable("ANTHROPIC_MODEL","cascata","User")
[Environment]::SetEnvironmentVariable("CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY","1","User")
```

> 🔑 A `<SUA_CHAVE_OMNIROUTE>` é uma chave de API **do OmniRoute** (não da Anthropic!).
> Crie em: painel → Settings/API Keys → Create. Ela só vale no seu PC.
>
> 💡 Ou rode o script pronto: [scripts/configurar-claude-env.ps1](../scripts/configurar-claude-env.ps1)

## ⚠️ A pegadinha nº 1: janelas velhas

Variáveis de ambiente novas **não chegam** em janelas já abertas. Depois de
gravar as variáveis:

1. Feche **TODAS** as janelas do VS Code e dos terminais
2. Abra de novo
3. Só então teste

Sintoma de janela velha: `Not logged in · Please run /login`.

## Teste de fogo

```powershell
claude -p "responda em uma frase: estou funcionando?"
```

Resposta esperada em alguns segundos. O aviso
`[claude-code:unrecognized_model]` é **cosmético** — ignore, ou silencie com:

```powershell
[Environment]::SetEnvironmentVariable("CLAUDE_CODE_DISABLE_UNKNOWN_MODEL_WINDOW_ENFORCEMENT","1","User")
```

## No VS Code

Abra a pasta do projeto → ícone do Claude na barra lateral (ou `Ctrl+Esc`) →
converse. Trocar de modelo: `/model` dentro do chat.

## Alternativa: `omniroute launch`

Em vez das variáveis, `omniroute launch` abre o Claude Code já configurado
(perfil isolado). Bom para testes rápidos; as variáveis são melhores para o
uso diário no VS Code.


## ✅ Checkpoint

No terminal **novo**: `claude -p "diga oi"` responde em alguns segundos. Se pedir `/login`, o terminal é velho — feche e reabra.

Próximo: [04-cascata.md](04-cascata.md)
