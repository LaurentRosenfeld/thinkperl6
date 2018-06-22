### Input and output files/dir
FILENAME = thinkperl6
OUTPUT_NAME = thinkperl6
PDF_OUTPUT = xelatex
DIR_NAME = tmpDir


### Compilation flags for pdflatex, xelatex, etc.
PDFLATEX_FLAGS = -halt-on-error\
				 -interaction=batchmode\
				 -output-format pdf\
				 -output-directory tmpDir\
				 -jobname=$(OUTPUT_NAME)
XELATEX_FLAGS = -halt-on-error\
				-interaction=batchmode\
			    -output-directory tmpDir\
			    -jobname=$(OUTPUT_NAME)

TEXINPUTS = .:$(DIR_NAME)/
TEXMFOUTPUT = $(DIR_NAME)

### Choose TeX engine
FLAGS = $(XELATEX_FLAGS)

### Compile tex into pdf
all: $(DIR_NAME)/$(FILENAME).pdf

$(DIR_NAME)/:
	mkdir -p $(DIR_NAME)

$(DIR_NAME)/$(FILENAME).aux: $(DIR_NAME)/
	$(PDF_OUTPUT) $(FLAGS) $(FILENAME)

$(DIR_NAME)/$(FILENAME).pdf: $(DIR_NAME)/$(FILENAME).aux
	$(PDF_OUTPUT) $(FLAGS) $(FILENAME)

### Clean
# Clean temporary files (including created PDF file) by removing
# the directory tmpDir/ created during the compilation process.

pdf:
	mv ./$(DIR_NAME)/$(FILENAME).pdf ../PDF/

clean:
	rm -rfv $(DIR_NAME)
