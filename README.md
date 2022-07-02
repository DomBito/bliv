# bliv -- A Bíblia Livre (*Textus Receptus*) na linha de comando

Uma ferramenta de terminal para buscar e ler a Palavra de Deus.

Bifurcação do [lukesmithxyz/vul](https://github.com/lukesmithxyz/vul), com a tradução de [blivre/BibliaLivre](https://github.com/blivre/BibliaLivre).
Sem os textos apócrifos, assim como na ideia original de implementação [bontibon/kjv](https://github.com/bontibon/kjv).

## Sobre a tradução

- Baseada na tradução Almeida de 1819, é uma tradução intermediária entre uma equivalência formal e uma equivalência dinâmica/funcional.
- As palavras em colchetes não têm correspondentes diretas e explícitas no texto das línguas originais. Estas são adicionadas à tradução por terem seu sentido inferido do contexto ou para tornar o texto adequado à língua portuguesa. Traduções como a ARC e ACF colocam essas palavras em itálico.
- A bíblia livre também pussui uma tradução com o texto crítico. Aqui disponibizei apenas a versão com o texto recebido. Se quiser uma versão com o texto crítico, fique à vontade para bifurcar o projeto.

Se quiser ler traduções não-livres como ARA, NAA, ARC, ACF, NTI, NTV e outras: acesse a [Bíblia Online](https://www.bibliaonline.com.br/).


## Uso

    uso: ./bliv [opções(flags)] [referência...]

      -l      lista os livros
      -W      cada versículo em uma linha
      -h      mostrar ajuda

      Tipos de referência:
          <Livro>
              Um livro por inteiro
          <Livro>:<Capítulo>
              Um capítulo de um livro
          <Livro>:<Capítulo>:<Versículo>[,<Versículo>]...
              Versículo(s) de um determinado capítulo de um livro
          <Livro>:<Capítulo>-<Capítulo>
              Intervalo de capítulos de um livro
          <Livro>:<Capítulo>:<Versículo>-<Versículo>
              Intervalo de versículos de um capítulo de um livro
          <Livro>:<Capítulo>:<Versículo>-<Capítulo>:<Versículo>
              Intervalo de versículos em um intervalo de capítulos de um livro

          /<Busca>
              Todos os versículos que tenham o padrão buscado
          <Livro>/<Busca>
              Todos os versículos em um livro que tenham o padrão buscado
          <Livro>:<Capítulo>/<Busca>
              Todos os versículos em um capítulo de um livro que tenham o padrão buscado

## Observações

Embora <Livro> aceite tanto a abreviação de 3 letras disponível na listagem, quanto o nome do livro em si (até mesmo digitado de forma incompleta), o programa não aceita os nomes dos livros sem os acentos latinos utilizados na língua portuguêsa (´,`,~,^, e ç).

## Instalação

Instale `bliv` rodando no terminal:

```
git clone https://github.com/DomBito/bliv.git
cd bliv
sudo make install
```

## Licença

O script em si é de domínio público.
Todas as Escrituras em língua portuguêsa aqui presentes são da [Bíblia Livre (BLIVRE)](http://sites.google.com/site/biblialivre/), Copyright © Diego Santos, Mario Sérgio, e Marco Teles, fevereiro de 2018. Licença [Creative Commons Atribuição 3.0 Brasil](http://creativecommons.org/licenses/by/3.0/br/). Reprodução permitida desde que devidamente mencionados fonte e autores.
