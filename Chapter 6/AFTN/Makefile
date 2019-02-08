Sources/AFTN/Resources: Resources/AFTN.g4
	@antlr -Dlanguage=Swift \
		-visitor \
		-listener \
		-message-format gnu \
		-o Sources/AFTN \
		Resources/AFTN.g4

.PHONY: test
test:
	@swift test

.PHONY: clean
clean:
	@rm -rf Sources/AFTN/Resources
