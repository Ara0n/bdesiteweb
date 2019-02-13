# exported rules
.PHONY: all assets images thumbnails lowres pages styles clean regenerate

# config options
OUTDIR := out

# external programs
CP := cp -a
RM := rm -rf
MKDIR := mkdir -p
LESSC := lessc
PAGEC := ./pagec
CONVERT := convert

# file list
PAGES = boiteaclou.php index.html membres.html edt.html
IMAGESMEMBERS = alexis.jpg alyssia.jpg clement.jpg daniel.jpg enora.jpg evan.jpg hugo.jpg killian.jpg mathis.jpg nicolas.jpg oceane.jpg thibault.jpg thomas.jpg
IMAGESGROUPS = all.jpg bre.jpg pole_com.jpg pole_event.jpg pole_kfet.jpg
ASSETS = IMPOS0__.ttf
TEMPLATES = src/template/head.html src/template/foot.html

# processed file list
IMAGES = $(IMAGESMEMBERS) $(IMAGESGROUPS)

INPAGES = $(foreach page, $(PAGES), src/pages/$(page))
INIMAGES = $(foreach image, $(IMAGES), src/images/$(image))
INASSETS = $(foreach asset, $(ASSETS), src/assets/$(asset))

OUTPAGES = $(foreach page, $(PAGES), $(OUTDIR)/$(page))
OUTIMAGES = $(foreach image, $(IMAGES), $(OUTDIR)/assets/$(image))
OUTASSETS = $(foreach asset, $(ASSETS), $(OUTDIR)/assets/$(asset))
OUTTHUMBNAILS = $(foreach image, $(IMAGES), $(OUTDIR)/assets/thumbnails/$(image:jpg=png))
OUTLOWRES = $(foreach image, $(IMAGES), $(OUTDIR)/assets/1344x/$(image))

#BEGIN exported rules
all: assets images thumbnails lowres pages styles
regenerate: clean all

clean:
	$(RM) $(OUTDIR)/*
	$(MKDIR) $(OUTDIR)/res $(OUTDIR)/assets $(OUTDIR)/assets/thumbnails $(OUTDIR)/assets/1344x

assets: $(OUTASSETS)
images: $(OUTIMAGES)
thumbnails: $(OUTTHUMBNAILS)
lowres: $(OUTLOWRES)
pages: $(OUTPAGES)
styles: $(OUTDIR)/res/styles.css
#END exported rules

#BEGIN internal rules
$(OUTDIR)/res/styles.css: src/styles/styles.less $(wildcard src/styles/*)
	$(LESSC) $< $@

$(OUTDIR)/%.html: src/pages/%.html $(TEMPLATES)
	$(PAGEC) $@ $<
$(OUTDIR)/%.php: src/pages/%.php $(TEMPLATES)
	$(PAGEC) $@ $<

$(OUTDIR)/assets/thumbnails/%.png: src/images/%.jpg
	$(CONVERT) $< -resize 512x $@

$(OUTDIR)/assets/1344x/%: src/images/%
	$(CONVERT) $< -resize 1344x $@

$(OUTDIR)/assets/%.jpg: src/images/%.jpg
	$(CP) $< $@

$(OUTDIR)/assets/%: src/assets/%
	$(CP) $< $@
#END internal rules
