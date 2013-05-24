BASE_DIR         = $(shell pwd)
REBAR           ?= $(BASE_DIR)/rebar
OVERLAY_VARS    ?=


.PHONY: rel deps

all: deps compile

compile:
	@$(REBAR) compile

deps:
	@$(REBAR) get-deps


generate:
	$(REBAR) generate $(OVERLAY_VARS)

rel: relclean compile generate

relclean:
	@rm -rf rel/coffer
