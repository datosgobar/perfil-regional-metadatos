GOOGLE_SPREADSHEET_ID = 1XVpFojav6Tn5sxX8r71V8aSafYJt66P4EHNRgoFX3DI

create_dir:
	mkdir -p docs
	mkdir -p schema
	mkdir -p schema/perfil-regional-metadatos-csv
	mkdir -p schema/perfil-regional-metadatos-html
	mkdir -p standards
	mkdir -p standards/iana_types

download_xlsx:
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/export?format=xlsx" -O schema/perfil-regional-metadatos.xlsx

download_csv:
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:csv&sheet=catalog" -O schema/perfil-regional-metadatos-csv/catalog.csv
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:csv&sheet=dataset" -O schema/perfil-regional-metadatos-csv/dataset.csv
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:csv&sheet=distribution" -O schema/perfil-regional-metadatos-csv/distribution.csv
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:csv&sheet=field" -O schema/perfil-regional-metadatos-csv/field.csv
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:csv&sheet=theme" -O schema/perfil-regional-metadatos-csv/theme.csv

download_html:
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:html&sheet=catalog" -O schema/perfil-regional-metadatos-html/catalog.html
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:html&sheet=dataset" -O schema/perfil-regional-metadatos-html/dataset.html
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:html&sheet=distribution" -O schema/perfil-regional-metadatos-html/distribution.html
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:html&sheet=field" -O schema/perfil-regional-metadatos-html/field.html
	wget "https://docs.google.com/spreadsheets/d/$(GOOGLE_SPREADSHEET_ID)/gviz/tq?tqx=out:html&sheet=theme" -O schema/perfil-regional-metadatos-html/theme.html

download: download_xlsx download_csv download_html

docs:
	mkdocs build
	$(BROWSER) site/index.html

servedocs:
	mkdocs serve
