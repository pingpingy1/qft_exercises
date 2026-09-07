LATEXMK = latexmk
BUILD = build

SETS := $(filter-out setN,$(basename $(notdir $(wildcard set*.tex))))

.PHONY: all clean $(SETS)

all: $(SETS)

$(SETS):
	@mkdir -p $(BUILD)
	$(LATEXMK) \
		-pdf \
		-interaction=nonstopmode \
		-outdir=$(BUILD) \
		-jobname=$@ \
		$@.tex

clean:
	rm -rf $(BUILD)
