# 8️⃣ Plugins, extensões e memória 🧠

A cereja do bolo: deixar o VS Code turbinado e dar **memória persistente**
ao Claude Code — ele lembra do seu projeto entre sessões.

## 🧠 claude-mem (o cérebro elefante)

[claude-mem](https://github.com/thedotmack/claude-mem) = memória persistente
para o Claude Code:

1. Durante a sessão, **captura observações** (arquivos lidos, comandos, decisões)
2. No fim, **comprime com IA** em resumos
3. Na sessão seguinte, **injeta o contexto relevante** → o Claude "lembra"
   do projeto sem você reexplicar

Extra: painel web em http://localhost:37777 com a linha do tempo da memória
e busca (`/mem-search` dentro do Claude).

### ⚠️ Pegadinha real (aconteceu neste guia!)

O claude-mem **precisa de uma IA para comprimir as memórias**. Se a IA dele
aponta para um endpoint sem credencial, ele falha **em silêncio** — worker
no ar, plugin ativo, e **zero memória gravada**.

A correção: apontar a IA de compressão dele para o **seu OmniRoute**
(`~/.claude-mem/settings.json` → endpoint `http://localhost:20128/v1`,
chave do gateway, modelo barato como `gemini/gemini-3.1-flash-lite`).
Compressão de memória grátis também. ✅

### 🧪 Como testamos de verdade

1. Criamos um projeto com README + CLAUDE.md + código
2. Sessão 1: "leia este projeto e ache a palavra secreta" → leu sozinho ✅
3. Sessão 2, com segredo dito só no prompt da sessão 1 → a IA lembrou
   pela memória injetada ✅

> 💡 Detalhe importante: o Claude Code já injeta o `CLAUDE.md` do projeto
> **nativamente** em toda sessão. Para provar memória de verdade, o segredo
> precisa existir **só na conversa**, não em arquivo.

## 🏗️ O ritual do projeto novo

Sempre que começar um projeto:

1. **README.md** — o que é, como roda (para humanos)
2. **CLAUDE.md** — o tapete de boas-vindas da IA: propósito, regras do
   projeto ("sempre responda em PT-BR"), comandos úteis, o que NÃO fazer
3. Abra a pasta no VS Code → o Claude lê os dois automaticamente
4. Trabalhe — o claude-mem guarda o resto

## 🧩 Extensões do VS Code (o arsenal completo)

### 🤖 IA
| Extensão | Função |
|---|---|
| Claude Code (Anthropic) | o protagonista — chat + edição de código |
| **Continue** | segundo assistente; pluga no MESMO OmniRoute (autocomplete grátis) |

### 🐳 DevOps
| Extensão | Função |
|---|---|
| Docker (Microsoft) | containers, images, Dockerfile |
| Kubernetes | manifests, clusters, kubectl visual |
| GitHub Actions | editar workflows + ver o CI sem sair do editor |
| YAML (Red Hat) | validação de compose/CI/k8s |
| Terraform | infra como código |
| Dev Containers | ambiente dev em container |

### 🔌 API
| Extensão | Função |
|---|---|
| Thunder Client | Postman dentro do VS Code |

### 🛠️ Produtividade
| Extensão | Função |
|---|---|
| Python + Pylance | essencial para Python |
| ESLint + Prettier | lint + formatação no save |
| Live Server | preview instantâneo de HTML (jogos!) |
| Code Runner | rodar trecho com 1 clique |
| GitLens + Git Graph | git turbinado + histórico visual |
| Error Lens | erros inline, sem caça ao Problems |
| TODO Highlight | TODO/FIXME brilhando |
| Better Comments | comentários coloridos |
| Material Icon Theme | ícones legíveis |
| Path Intellisense | autocompletar caminhos |
| indent-rainbow | indentação colorida |
| EditorConfig | padrões consistentes |
| Spell Checker (+ PT-BR) | corretor ortográfico |
| Markdown All in One | atalhos e preview de Markdown |

## 🔒 Nota de segurança

A memória do claude-mem fica **100% local** (`~/.claude-mem`, SQLite).
Use a tag de exclusão dele para conteúdo sensível, e lembre: prompts vão
para provedores gratuitos — nada de segredos nos prompts.


## 🔄 Bônus: Settings Sync (suas configs em qualquer PC)

O VS Code sincroniza **nativamente** (sem extensão extra!): ícone de conta 👤
no canto inferior esquerdo → **"Turn on Settings Sync"** → entre com GitHub
ou Microsoft.

Leva para qualquer máquina onde você logar: **extensões**, settings, atalhos
e snippets. Máquina nova = instala VS Code → login → tudo volta sozinho.

> ⚠️ Ele NÃO leva variáveis de ambiente do Windows nem o OmniRoute — para
> isso, rode o [scripts/configurar-claude-env.ps1](../scripts/configurar-claude-env.ps1)
> na máquina nova.

Próximo: [08-troubleshooting.md](08-troubleshooting.md)
