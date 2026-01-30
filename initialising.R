# initialising the creation of the r script called smartr

pacman::p_load(
  available,
  devtools,
  usethis,
  roxygen2)


available::available("dailyr", browse = FALSE)
# quickr und smartr und fastr nicht available auf cran und github
# handyr nicht auf github
# dailyr schon
# sinnvollr und schnellr gibt es auch noch



usethis::create_package("C:/Users/kratz/OneDrive/Documents/01_Arbeit/04_FU_Berlin/R/dailyr")


# dann im neuen projekt:
usethis::use_r("convert_path")


usethis::use_git_ignore("initialising.R")   # Verhindert Upload auf GitHub
usethis::use_build_ignore("initialising.R") # Verhindert Aufnahme in das R-Paket
