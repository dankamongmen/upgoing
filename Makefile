# just for building images
.DELETE_ON_ERROR:
.PHONY: all clean
.DEFAULT_GOAL:=all

OUT:=out
DOT:=$(addprefix dot/, $(addsuffix .dot, nature phases rational))
GRAPHS:=$(addprefix $(OUT)/, $(addsuffix .png, $(DOT)))

all: $(GRAPHS)

$(OUT)/dot/%.png: dot/%
	@mkdir -p $(@D)
	circo -Tpng $< > $@

clean:
	@rm -fv $(GRAPHS)
