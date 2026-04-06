################################################################################
# CONFIGURAÇÃO INICIAL DO GIT E GITHUB NO R
# Objetivo: Configurar a autenticação e integração entre o R, o Git e o GitHub,
#            permitindo versionar projetos locais e sincronizá-los com repositórios
#            remotos.
################################################################################

# ------------------------------------------------------------------------------
# 1. Ativar o pacote 'usethis'
# ------------------------------------------------------------------------------
# O pacote 'usethis' facilita tarefas de configuração de ambiente e integração
# com Git e GitHub diretamente pelo RStudio, automatizando comandos do Git.
# ------------------------------------------------------------------------------
library(usethis)


# ------------------------------------------------------------------------------
# 2. Configurar informações de usuário do Git
# ------------------------------------------------------------------------------
# A função use_git_config() define as informações de identidade que serão usadas
# pelo Git para registrar as alterações e commits. 
#
# Argumentos principais:
# - user.name  → nome do usuário que aparecerá nos commits (igual ao do GitHub).
# - user.email → e-mail associado à sua conta GitHub (ou ao Git local).
#
# Essas informações são salvas globalmente no arquivo de configuração do Git 
# (~/.gitconfig), portanto só precisam ser definidas uma vez.
# ------------------------------------------------------------------------------
use_git_config(
  user.name = "negugu",          # Nome do usuário do GitHub
  user.email = "gustavonfa@id.uff.br"          # E-mail vinculado à conta GitHub
)


# ------------------------------------------------------------------------------
# 3. Criar um token de acesso pessoal (Personal Access Token - PAT)
# ------------------------------------------------------------------------------
# A função create_github_token() abre automaticamente a página do GitHub 
# para criar um token de autenticação.
#
# O token substitui a senha em operações que envolvem autenticação (como 
# push/pull), pois o GitHub não aceita mais autenticação com senha.
#
# O processo:
#   - A função abrirá o navegador em: https://github.com/settings/tokens
#   - Escolha “Generate new token (classic)” ou “Fine-grained token”
#   - Copie o token gerado (ele aparece uma única vez!)
#
# Importante: nunca compartilhe esse token publicamente.
# ------------------------------------------------------------------------------
usethis::create_github_token()


# ------------------------------------------------------------------------------
# 4. Registrar o token no Git local
# ------------------------------------------------------------------------------
# A função gitcreds::gitcreds_set() serve para armazenar de forma segura o 
# token de acesso criado anteriormente no cache do Git local.
#
# Ao rodar este comando:
#   - Será aberta uma linha de comando no Console.
#   - Cole o token gerado no passo anterior e pressione ENTER.
#
# O token será salvo de forma criptografada e usado automaticamente em 
# autenticações futuras (sem precisar inserir manualmente).
# ------------------------------------------------------------------------------
gitcreds::gitcreds_set()

################################################################################
# Após esses passos:
# - Seu R/Git estão autenticados no GitHub.
# - Você pode criar e conectar repositórios com:
#     usethis::use_git()
#     usethis::use_github()
# - E já poderá realizar commits, pushes e pulls diretamente pelo RStudio.
################################################################################
usethis::use_git()
