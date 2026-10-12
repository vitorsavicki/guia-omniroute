# 2️⃣ Provedores gratuitos

O OmniRoute tem 300+ providers no catálogo. Estes foram **testados de verdade**:

## ✅ Recomendados

### Google Gemini (AI Studio) — o melhor custo-benefício
1. https://aistudio.google.com/apikey → login Google → **Create API key** (grátis, sem cartão)
2. Painel OmniRoute → **Providers** → busca `Gemini` → cole a chave → salve
3. Modelos úteis: `gemini/gemini-3.1-flash-lite` (cotão, rápido) e
   `gemini/gemini-3.8-flash` (mais esperto, cota diária pequena)

### DuckDuckGo AI — zero cadastro
- Categoria **NOAUTH**: no painel, página Providers → seção **Free** → conecte `duckduckgo-web`
- Modelos: `ddgw/gpt-5.4-mini`, `ddgw/claude-haiku-4-5` e mais 4
- ⚠️ Cota anônima limitada (`429 ERR_CONVERSATION_LIMIT`) — reseta em horas

### Grok (xAI) — o peso-pesado surpresa
- No painel, conecte **grok-cli** e faça o login social
- `grok-cli/grok-4.7` respondeu de primeira nos testes

### OpenRouter — o shopping dos `:free`
1. https://openrouter.ai → Sign in → **Keys** → Create Key
2. Providers → `OpenRouter` → cole a chave
3. Procure modelos com selo `:free` (ex.: `openrouter/nvidia/nemotron-3-super-120b-a12b:free`)
- ⚠️ Modelos `:free` entram em cooldown de segundos às vezes — normal

## ❌ Testado e não rolou

| Provedor | Problema |
|---|---|
| GitHub (Copilot) | exige **licença Copilot** paga na conta (403) |
| uncloseai | modelo do catálogo aposentado upstream (404) |
| opencode | chat grátis só funciona dentro do app deles |
| aihorde | só modelos de imagem |

## 🧠 A mentalidade das cotas

Provedor grátis = cota limitada. **Cada modelo tem cota separada** — quando um
estoura (`429`), outro continua vivo. Por isso o próximo capítulo existe:
a cascata faz a troca automaticamente.

Próximo: [03-claude-code.md](03-claude-code.md)
