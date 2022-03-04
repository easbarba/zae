.DEFAULT_GOAL := install

fmt:
	rufo lib/*
.PHONY:fmt

lint: fmt
	reek lib/*

deps:
	gem install bundler --no-document
	bundle check || bin/setup

install: deps
	rake install
