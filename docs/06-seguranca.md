# 6️⃣ Segurança (não pule!) 🔒

## 1. Troque a senha do painel — HOJE

A senha de fábrica do OmniRoute é **`CHANGEME`**, pública e documentada.
Painel → Settings ⚙️ → trocar senha. Qualquer um na sua rede (ou você mesmo
num Wi-Fi público) agradece.

## 2. Tranque o gateway no localhost

Por padrão o OmniRoute escuta em `0.0.0.0` (toda a rede). Restrinja:

```
# arquivo: C:\Users\VOCE\.omniroute\.env  (crie se não existir)
OMNIROUTE_SERVER_HOST=127.0.0.1
```

Reinicie o daemon. Use o `.env` do **perfil** (o `.env` dentro do pacote npm é
sobrescrito em updates).

## 3. Higiene com chaves

- Chaves de API **nunca** no chat, em commits ou em prints
- Cole direto no painel do OmniRoute ou em comandos locais
- A chave do OmniRoute só precisa existir nas **variáveis de ambiente** e no
  painel — não anote em arquivo solto
- Perdeu/vazou? Revogue no painel e gere outra (são locais, grátis e instantâneas)

## 4. Em repositórios públicos

- Configure o git com o e-mail **noreply** do GitHub, não seu e-mail real:

```powershell
git config user.email "SEU_USUARIO@users.noreply.github.com"
```

- Ative em Settings → Code security: **secret scanning**, **push protection**,
  **Dependabot alerts**
- Este repo roda **gitleaks** no CI para garantir que nenhum segredo vaze

## 5. Ao publicar sites estáticos

Use headers de segurança. No Cloudflare Pages/Workers, um arquivo `_headers`
na raiz resolve (exemplo real de um projeto irmão deste guia):

```
/*
  Content-Security-Policy: default-src 'self'; script-src 'self'; style-src 'self'
  X-Content-Type-Options: nosniff
  X-Frame-Options: DENY
  Referrer-Policy: no-referrer
```

## 6. Modelos `:free` e privacidade

Provedores gratuitos podem **usar suas conversas** (leia os termos de cada um).
Regra simples: nada de senhas, dados pessoais ou código proprietário sensível
nos prompts. Para estudo e projetos pessoais: à vontade.

Próximo: [07-troubleshooting.md](07-troubleshooting.md)
