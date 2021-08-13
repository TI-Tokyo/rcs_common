REPO		?= rcs_common
HEAD_REVISION   ?= $(shell git describe --tags --exact-match HEAD 2>/dev/null)
BASE_DIR         = $(shell pwd)
ERLANG_BIN       = $(shell dirname $(shell which erl 2>/dev/null) 2>/dev/null)
OTP_VER          = $(shell echo $(ERLANG_BIN) | rev | cut -d "/" -f 2 | rev)
REBAR           ?= $(BASE_DIR)/rebar3

.PHONY: deps test

all: deps compile

compile: deps
	@($(REBAR) compile)

deps:
	@$(REBAR) get-deps

clean:
	@$(REBAR) clean

distclean: clean
	@$(REBAR) delete-deps

DIALYZER_APPS = kernel stdlib sasl erts ssl tools os_mon runtime_tools crypto inets \
	webtool eunit syntax_tools compiler
PLT ?= $(HOME)/.rcs_common_dialyzer_plt
