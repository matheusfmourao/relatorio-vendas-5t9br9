#!/bin/bash
# Gera o relatorio do Alfabetilar e publica no GitHub Pages.
#
#   ./publicar.sh        # ultimos 7 dias
#   ./publicar.sh 3      # ultimos 3 dias
#
# A URL nao muda entre publicacoes — o Carlos salva uma vez e volta sempre nela.

set -u

DIAS="${1:-7}"
AQUI="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$HOME/Documents/segundo-cerebro/clientes/yasmin-arquivo-homeschooling/rastreamento/scripts"

cd "$SCRIPTS" || { echo "Nao achei $SCRIPTS"; exit 1; }

echo "Gerando relatorio ($DIAS dias)..."
python3 halfa.py "$DIAS" --html || { echo "halfa.py falhou — nada publicado."; exit 1; }

GERADO="$SCRIPTS/relatorio-alfabetilar.html"
[ -s "$GERADO" ] || { echo "HTML vazio ou ausente — nada publicado."; exit 1; }

cp "$GERADO" "$AQUI/index.html"

cd "$AQUI" || exit 1
if git diff --quiet -- index.html 2>/dev/null; then
    echo "Nenhuma mudanca no relatorio. Nada a publicar."
    exit 0
fi

git add index.html
git commit -qm "Relatorio Alfabetilar — $(date '+%d/%m/%Y %H:%M')"
git push -q origin HEAD && echo "Publicado." || { echo "Push falhou."; exit 1; }

echo
echo "https://matheusfmourao.github.io/relatorio-vendas-5t9br9/"
echo "(a atualizacao leva ~1 min para aparecer)"
