# Guia OmniRoute: sua IA grátis, sua regra 🚀

**Claude Code, VS Code e o que mais você quiser — sem pagar plano, sem depender de um provedor só.**
Guia completo, testado na prática, usando o [OmniRoute](https://github.com/diegosouzapw/OmniRoute) como gateway para
provedores de IA gratuitos — com **cascata anti-cota** (failover automático),
autostart no Windows e segurança desde o dia um.

> Todo o passo a passo foi executado de verdade em um Windows 10, incluindo os
> erros e as correções. Nada aqui é teoria.

## 🗺️ Arquitetura

```
┌──────────────┐     ┌───────────────────┐     ┌─────────────────────────┐
│  Claude Code │────▶│ OmniRoute (local) │────▶│ Provedores GRÁTIS:      │
│  (VS Code /  │     │ localhost:20128   │     │ Gemini · DuckDuckGo ·   │
│   terminal)  │◀────│ combo "cascata"   │◀────│ Grok · OpenRouter :free │
└──────────────┘     └───────────────────┘     └─────────────────────────┘
```

O Claude Code aponta para o OmniRoute (uma URL local + uma chave local).
O OmniRoute roteia para o primeiro provedor **com cota disponível** — se um
estoura o limite grátis, o próximo da fila assume **sem você perceber**.

## 📚 O guia

| Etapa | Arquivo |
|---|---|
| 1️⃣ Instalação do OmniRoute (inclusive com disco C: cheio) | [docs/01-instalacao.md](docs/01-instalacao.md) |
| 2️⃣ Provedores gratuitos: quais conectar e como | [docs/02-provedores.md](docs/02-provedores.md) |
| 3️⃣ Claude Code + VS Code apontando pro gateway | [docs/03-claude-code.md](docs/03-claude-code.md) |
| 4️⃣ A cascata anti-cota (nunca mais troque modelo na mão) | [docs/04-cascata.md](docs/04-cascata.md) |
| 5️⃣ Autostart no Windows + pegadinhas do sistema | [docs/05-autostart-e-dicas.md](docs/05-autostart-e-dicas.md) |
| 6️⃣ Segurança (obrigatório!) | [docs/06-seguranca.md](docs/06-seguranca.md) |
| 🆘 Troubleshooting — todos os erros reais e as soluções | [docs/07-troubleshooting.md](docs/07-troubleshooting.md) |

## ⚡ Scripts prontos

- [`scripts/configurar-claude-env.ps1`](scripts/configurar-claude-env.ps1) — grava as variáveis de ambiente do Claude Code
- [`scripts/iniciar-tudo.bat`](scripts/iniciar-tudo.bat) — sobe OmniRoute + servidor local de uma vez (use no shell:startup)

## 🧪 Provedores validados (out/2026)

| Provedor | Cadastro | Velocidade | Observação |
|---|---|---|---|
| **Google Gemini** (AI Studio) | conta Google | ⭐⭐⭐ | `gemini-3.1-flash-lite` = cotão; `3.8-flash` é forte mas cota diária pequena |
| **DuckDuckGo AI** | **nenhum** | ⭐⭐ | zero config; cota anônima reseta em horas |
| **Grok (xAI)** | login social | ⭐⭐⭐ | grok-cli no OmniRoute |
| **OpenRouter** | conta grátis | ⭐⭐ | dezenas de modelos `:free` |
| GitHub Copilot | precisa licença | — | ❌ só funciona com assinatura Copilot |

## 🔒 Segurança

Este repo pratica o que prega: gitleaks no CI, `SECURITY.md`, e um capítulo
inteiro de hardening. **Nunca** commite chaves — todas as chaves do guia usam
placeholders `<...>`.

## 📝 Licença

MIT — use, adapte, compartilhe. Se o guia te ajudou, deixa uma ⭐!
