TMP = .
OUTPUT = .
INPUT = .

objects = $(OUTPUT)/logo_horizontal_dark.png \
	  $(OUTPUT)/logo_horizontal_light.png \
	  $(OUTPUT)/logo_vertical_light.png \
	  $(OUTPUT)/logo_vertical_dark.png

all: $(objects)

$(OUTPUT)/%.png: $(TMP)/%_raw.png
	pngquant --speed 1 $^ --output $@

$(TMP)/logo_vertical_light_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 2000x2000+3000+0 +repage $^ $@

$(TMP)/logo_vertical_dark_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 2000x2000+5000+0 +repage $^ $@

$(TMP)/logo_horizontal_dark_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 3000x1000+0+0 +repage $^ $@

$(TMP)/logo_horizontal_light_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 3000x1000+0+1000 +repage $^ $@

$(TMP)/logo.png: $(INPUT)/logo.svg
	inkscape \
		--file=$< \
		--export-png=$@ \
		--export-area-page

clean:
	rm -f $(objects) *_raw.png
