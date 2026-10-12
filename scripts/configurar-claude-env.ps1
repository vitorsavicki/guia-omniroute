# Configura o Claude Code para usar o OmniRoute local (grátis)
# Uso:  powershell -File configurar-claude-env.ps1
# (depois FECHE e REABRA todos os terminais e o VS Code!)

param(
  [string]$OmniRouteKey = "<SUA_CHAVE_OMNIROUTE>",   # painel → API Keys → Create
  [string]$Modelo       = "cascata"                  # combo anti-cota (ver docs/04)
)

if ($OmniRouteKey -eq "<SUA_CHAVE_OMNIROUTE>") {
  Write-Host "ERRO: edite o script e coloque sua chave do OmniRoute em -OmniRouteKey" -ForegroundColor Red
  Write-Host "Crie uma em: http://localhost:20128 (painel -> API Keys)" -ForegroundColor Yellow
  exit 1
}

[Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL","http://localhost:20128","User")
[Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN",$OmniRouteKey,"User")
[Environment]::SetEnvironmentVariable("ANTHROPIC_MODEL",$Modelo,"User")
[Environment]::SetEnvironmentVariable("CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY","1","User")
[Environment]::SetEnvironmentVariable("CLAUDE_CODE_DISABLE_UNKNOWN_MODEL_WINDOW_ENFORCEMENT","1","User")

Write-Host "Variaveis gravadas! Feche e reabra TODOS os terminais e o VS Code." -ForegroundColor Green
Write-Host "Teste: claude -p \"diga oi\"" -ForegroundColor Cyan
