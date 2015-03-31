TMP = .
OUTPUT = .
INPUT = .

objects = horizontal_dark \
	  horizontal_light \
	  vertical_light \
	  vertical_dark \
	  only_dark \
	  only_light \

all: $(OUTPUT)/favicon.ico $(addsuffix .png,$(addprefix $(OUTPUT)/logo_,$(objects))) 

$(OUTPUT)/%.png: $(TMP)/%_raw.png
	pngquant --force --speed 1 $^ --quality=65-90 --output $@

$(TMP)/logo.png: $(INPUT)/logo.svg
	inkscape \
		--file=$< \
		--export-png=$@ \
		--export-area-page

clean:
	rm -f $(objects) *_raw.png


#####################################
#
#  Create icon files
#
#####################################

$(OUTPUT)/favicon.ico: $(TMP)/icon_16.png $(TMP)/icon_32.png $(TMP)/icon_48.png $(TMP)/icon_64.png $(TMP)/icon_128.png $(TMP)/icon_256.png
	convert -delete 0 -alpha off -colors 256 $^ $@

$(TMP)/icon_%.png: $(TMP)/logo_only_light_raw.png
	convert -bordercolor white -border 0 -resize $*x$* $< $@


#####################################
#
#  Cut individual images from source
#
#####################################


$(TMP)/logo_only_dark_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 2000x2000+9000+0 +repage $^ $@

$(TMP)/logo_only_light_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 2000x2000+7000+0 +repage $^ $@

$(TMP)/logo_vertical_dark_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 2000x2000+5000+0 +repage $^ $@

$(TMP)/logo_vertical_light_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 2000x2000+3000+0 +repage $^ $@

$(TMP)/logo_horizontal_dark_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 3000x1000+0+0 +repage $^ $@

$(TMP)/logo_horizontal_light_raw.png: $(TMP)/logo.png
	convert -colors 255 -crop 3000x1000+0+1000 +repage $^ $@
