# just for building images
.DELETE_ON_ERROR:
.PHONY: all clean
.DEFAULT_GOAL:=all

OUT:=out
CIRCO:=$(addprefix circo/, $(addsuffix .dot, nature phases rational))
DOT:=$(addprefix dot/, $(addsuffix .dot, central death jumble))
GRAPHS:=$(addprefix $(OUT)/, $(addsuffix .png, $(CIRCO) $(DOT)))

all: $(GRAPHS)

$(OUT)/dot/%.png: dot/%
	@mkdir -p $(@D)
	dot -Tpng $< > $@

$(OUT)/circo/%.png: circo/%
	@mkdir -p $(@D)
	circo -Tpng $< > $@

clean:
	@rm -rfv $(OUT)
