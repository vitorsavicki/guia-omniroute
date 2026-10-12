# 🆘 Troubleshooting — erros reais, soluções reais

Todos estes aconteceram na prática durante a criação deste guia.

| Sintoma | Causa | Solução |
|---|---|---|
| `Not logged in · Please run /login` | terminal/VS Code **velho**, sem as variáveis novas | fechar TUDO e abrir de novo |
| `claude -p` trava sem responder | provedor único em cooldown; breaker esperando (12s→96s) | usar a [cascata](04-cascata.md); ou aguardar/trocar de modelo |
| `429 · credentials ... cooling down` | cota grátis do **modelo** estourada | outro modelo (cota é por modelo!); amanhã reseta |
| `429 ERR_CONVERSATION_LIMIT` (ddgw) | cota anônima do DuckDuckGo | reseta em horas; use outro degrau da cascata |
| `403 not licensed to use Copilot` (github) | conta sem licença Copilot | remover o provider; Copilot é pago |
| `[claude-code:unrecognized_model]` | modelo de gateway fora do catálogo do Claude Code | **cosmético** — ignore ou `CLAUDE_CODE_DISABLE_UNKNOWN_MODEL_WINDOW_ENFORCEMENT=1` |
| `TAR_ENTRY_ERROR ENOENT` no npm install | caminhos longos do Windows | `LongPathsEnabled=1` + retry |
| painel `free-provider-rankings` vazio | sync do leaderboard falhou no 1º boot | normal; se resolve sozinho (retry em ~6h). Use a página Providers |
| botão "conectar" não aparece no painel | providers NOAUTH conectam via seção **Free/onboarding** da página Providers | ou use `omniroute providers add <id>` |
| health check timeout logo após start | bootstrap leva ~2 min | aguarde e teste de novo |
| `claude` não acha modelos na lista do VS Code | a lista espelha o gateway; provider sem cota = todos os aliases falham | cascata resolve; confira `/v1/models` |

## Diagnóstico rápido (cola no PowerShell)

```powershell
# O gateway está vivo?
curl.exe -s -o NUL -w "%{http_code}`n" http://127.0.0.1:20128/api/monitoring/health

# As variáveis chegaram neste terminal?
cmd /c "set ANTHROPIC"

# O que o gateway diz sobre um modelo?
$body = '{"model":"cascata","messages":[{"role":"user","content":"oi"}],"max_tokens":10}'
curl.exe -s -X POST http://127.0.0.1:20128/v1/chat/completions -H "Content-Type: application/json" -H "Authorization: Bearer <SUA_CHAVE_OMNIROUTE>" -d $body

# O log conta tudo:
Get-Content "$env:USERPROFILE\.omniroute\logs\application\app.log" -Tail 30
```

Ainda travado? Abra uma issue usando o template 🐛.
