setwd("C:/Users/Nasser/_dev/2020-census-race-dot-map")

# This short script takes the PL94-717 files and outputs all of the demographic data attached to the tigris shapefiles for each census block.

library(tidyverse)
library(sf)
library(PL94171)
library(tigris)
#options(tigris_use_cache = TRUE)

# `data/ma2020.pl` is a directory with the four P.L. 94-171 files for Massachusetts
pl_raw <- pl_read("data/ma2020.pl")
pl <- pl_subset(pl_raw, sumlev="150")
# pl <- pl_select_standard(pl)

mass_blocks = block_groups("MA", progress_bar=FALSE)

mass <- right_join(pl, mass_blocks, by="GEOID")

st_write(mass, "mass.shp", append=FALSE)
