TMP = .
OUTPUT = .
INPUT = .

objects = logo_horizontal_dark.png logo_horizontal_light.png 

all: $(objects)

$(OUTPUT)/%.png: $(TMP)/%_raw.png
	pngcrush $^ $@

$(TMP)/logo_horizontal_dark_raw.png: $(TMP)/logo.png
	convert -crop 3000x1000+0+0 +repage $^ $@

$(TMP)/logo_horizontal_light_raw.png: $(TMP)/logo.png
	convert -crop 3000x1000+0+1000 +repage $^ $@

$(TMP)/logo.png: $(INPUT)/logo.svg
	convert $^ $@

clean:
	rm -f $(objects) *_raw.png
