.PHONY: help build clean test pdfs

ARTICLES=./doc/articles.txt

help:
	@echo "make [options] [target]\nTargets:\n \
	help  - Lista de targets.\n \
	build - Compila código.\n \
	clean - Limpia ejecutables.\n \
	test  - Ejecuta pruebas.\n \
	pkgs  - Instala paquetes.\n"

build:
	@echo "Compilando...\n"
	@mkdir -p ./bin/

pdfs:
	@while IFS= read -r linea; do \
		typst compile ./doc/$$linea/$$linea.typ; \
	done < $(ARTICLES)

clean:
	@echo "Limpiando ejecutables...\n"
	@rm -rf ./bin/

test:
	@echo "Ejecutando pruebas...\n"

pkgs:
	@echo "Instalando paquetes...\n"
	@curl -fsSL https://install.typst.community/install.sh | sh
	@sudo cp ~/.typst/bin/typst /usr/local/bin/
