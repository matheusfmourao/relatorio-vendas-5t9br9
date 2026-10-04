# relatorio-vendas-5t9br9

Painel estático de origem de vendas (Alfabetilar), publicado via GitHub Pages:

**https://matheusfmourao.github.io/relatorio-vendas-5t9br9/**

## Como atualizar

```
~/.local/bin/publicar-alfabetilar.sh        # últimos 7 dias
~/.local/bin/publicar-alfabetilar.sh 3      # últimos 3 dias
```

O comando gera o HTML a partir da API da Hotmart, grava como `index.html` e
publica. A URL não muda — o Carlos salva uma vez e volta sempre nela.
A atualização leva ~1 min para aparecer.

Se o relatório não mudou desde a última vez, não faz commit.

## Por que o script mora em `~/.local/bin/`

Ele ficava aqui, mas o agendamento automático (`launchd`) foi descartado: o TCC
do macOS bloqueia o acesso a `~/Documents` em processo sem interface gráfica —
o `python3` não consegue abrir `halfa.py` nem pelo caminho absoluto. As saídas
seriam dar Acesso Total ao Disco ao `/bin/bash` (amplo demais) ou tirar o
gerador do segundo cérebro. Ficou manual, um comando por dia.

## O gerador

`halfa.py`, em
`segundo-cerebro/clientes/yasmin-arquivo-homeschooling/rastreamento/scripts/`.

Sem dado individual de comprador: só totais por canal.
