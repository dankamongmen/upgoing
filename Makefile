# just for building images
.DELETE_ON_ERROR:
.PHONY: all clean
.DEFAULT_GOAL:=all

OUT:=out
CIRCO:=$(addprefix circo/, $(addsuffix .dot, nature phases rational))
GRAPHS:=$(addprefix $(OUT)/, $(addsuffix .png, $(CIRCO)))

all: $(GRAPHS)

$(OUT)/circo/%.png: circo/%
	@mkdir -p $(@D)
	circo -Tpng $< > $@

clean:
	@rm -fv $(GRAPHS)
