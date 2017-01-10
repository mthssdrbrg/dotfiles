.PHONY: mac lnx

mac:
	RCRC=$(CURDIR)/tag-mac/rcrc rcup -vvv

lnx:
	RCRC=$(CURDIR)/tag-lnx/rcrc rcup -vvv
