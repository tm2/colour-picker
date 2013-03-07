
build: components index.js colourpicker.css
	coffee -c -b index.coffee
	@component build --dev

components: component.json
	@component install --dev

clean:
	rm -fr build components

.PHONY: clean
