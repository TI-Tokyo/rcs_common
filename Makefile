REBAR ?= ./rebar3

.PHONY: compile rel clean test

all: compile

compile:
	@$(REBAR) compile
rel:
	@$(REBAR) as rel release
clean:
	@$(REBAR) clean
relclean:
	rm -rf _build/rel/rel/rcs_common
test:
	@$(REBAR) eunit
