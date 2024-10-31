XML2RFC = xml2rfc
XML2RFC_OPTIONS =

XMLS := $(wildcard *.xml)
TXTS := $(patsubst %.xml,%.txt,$(XMLS))
HTMLS := $(patsubst %.xml,%.html,$(XMLS))
PDFS := $(patsubst %.xml,%.pdf,$(XMLS))

txt: $(TXTS)

html: $(HTMLS)

pdf: $(PDFS)

%.txt: %.xml
	$(XML2RFC) $(XML2RFC_OPTIONS) --text -o $@ $<

%.html: %.xml
	$(XML2RFC) $(XML2RFC_OPTIONS) --html -o $@ $<

%.pdf: %.xml
	$(XML2RFC) $(XML2RFC_OPTIONS) --pdf -o $@ $<

clean:
	rm -f *.txt *.html