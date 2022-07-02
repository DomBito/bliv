#!/bin/sh
# bliv: Leia a palavra de Deus do seu terminal.
# License: Public domain

SELF="$0"

get_data() {
	sed '1,/^#EOF$/d' < "$SELF" | tar xz -O "$1"
}

if [ -z "$PAGER" ]; then
	if command -v less >/dev/null; then
		PAGER="less"
	else
		PAGER="cat"
	fi
fi

show_help() {
	exec >&2
	echo "uso: $(basename "$0") [opções(flags)] [referência...]"
	echo
	echo "  -l      lista os livros"
	echo "  -W      cada versículo em uma linha"
	echo "  -h      mostrar ajuda"
	echo
	echo "  Tipos de referência:"
	echo "      <Livro>"
	echo "          Um livro por inteiro"
	echo "      <Livro>:<Capítulo>"
	echo "          Um capítulo de um livro"
	echo "      <Livro>:<Capítulo>:<Versículo>[,<Versículo>]..."
	echo "          Versículo(s) de um determinado capítulo de um livro"
	echo "      <Livro>:<Capítulo>-<Capítulo>"
	echo "          Intervalo de capítulos de um livro"
	echo "      <Livro>:<Capítulo>:<Versículo>-<Versículo>"
	echo "          Intervalo de versículos de um capítulo de um livro"
	echo "      <Livro>:<Capítulo>:<Versículo>-<Capítulo>:<Versículo>"
	echo "          Intervalo de versículos em um intervalo de capítulos de um livro"
	echo
	echo "      /<Busca>"
	echo "          Todos os versículos que tenham o padrão buscado"
	echo "      <Livro>/<Busca>"
	echo "          Todos os versículos em um livro que tenham o padrão buscado"
	echo "      <Livro>:<Capítulo>/<Busca>"
	echo "          Todos os versículos em um capítulo de um livro que tenham o padrão buscado"
	exit 2
}

while [ $# -gt 0 ]; do
	isFlag=0
	firstChar="${1%"${1#?}"}"
	if [ "$firstChar" = "-" ]; then
		isFlag=1
	fi

	if [ "$1" = "--" ]; then
		shift
		break
	elif [ "$1" = "-l" ]; then
		# List all book names with their abbreviations
		get_data bliv.tsv | awk -v cmd=list "$(get_data bliv.awk)"
		exit
	elif [ "$1" = "-W" ]; then
		export KJV_NOLINEWRAP=1
		shift
	elif [ "$1" = "-h" ] || [ "$isFlag" -eq 1 ]; then
		show_help
	else
		break
	fi
done

cols=$(tput cols 2>/dev/null)
if [ $? -eq 0 ]; then
	export KJV_MAX_WIDTH="$cols"
fi

if [ $# -eq 0 ]; then
	if [ ! -t 0 ]; then
		show_help
	fi

	# Interactive mode
	while true; do
		printf "bliv> "
		if ! read -r ref; then
			break
		fi
		get_data bliv.tsv | awk -v cmd=ref -v ref="$ref" "$(get_data bliv.awk)" | ${PAGER}
	done
	exit 0
fi

get_data bliv.tsv 2>/dev/null | awk -v cmd=ref -v ref="$*" "$(get_data bliv.awk)" 2>/dev/null | ${PAGER}
