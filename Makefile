BUILD = build
BOOKNAME = Kraken
TITLE = title.txt
# METADATA = metadata.xml
CHAPTERS = kraken/Kraken-final-ed1.md
COVER_IMAGE = cover/kraken_standing-book-cover_sqcrop.png
LATEX_CLASS = report
CSS = epub.css

all: book

book: epub html pdf

clean:
	rm -r $(BUILD)

epub: $(BUILD)/epub/$(BOOKNAME).epub

html: $(BUILD)/html/$(BOOKNAME).html

pdf: $(BUILD)/pdf/$(BOOKNAME).pdf

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
#	pandoc --css=$(CSS) --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^
	pandoc --css=$(CSS) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

$(BUILD)/html/$(BOOKNAME).html: $(CHAPTERS)
	mkdir -p $(BUILD)/html
	pandoc $(TOC) --to=html5 -o $@ $^

$(BUILD)/pdf/$(BOOKNAME).pdf: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/pdf
	pandoc $(TOC) --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $@ $^

.PHONY: all book clean epub html pdf
