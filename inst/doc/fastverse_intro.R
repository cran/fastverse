## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#" # comment = "#>" # tidy = FALSE #, out.width = '100%' #,  cache = FALSE
)
# https://github.com/r-lib/crayon/issues/24
options(repos = c(CRAN = "https://cran.rstudio.com/")) # crayon.enabled = TRUE

# Hooks needs to be set to deal with outputs
# thanks to fansi logic
# old_hooks <- fansi::set_knit_hooks(knitr::knit_hooks, 
#                                    which = c("output", "message", "error"))

.fv_styling <- FALSE # identical(Sys.getenv("PKGDOWN"), "TRUE")

options(fastverse.styling = .fv_styling)

## -----------------------------------------------------------------------------
library(fastverse)

## -----------------------------------------------------------------------------
# Checking for any updates
fastverse_update()

## -----------------------------------------------------------------------------
# Extend the fastverse for the session
fastverse_extend(xts, roll, fasttime)

# See that these are now part of the fastverse
fastverse_packages()

# They are also saved in a like-named option 
options("fastverse.extend")

## -----------------------------------------------------------------------------
# Detaches all packages (including the fastverse) but does not (default) unload them
fastverse_detach()

## -----------------------------------------------------------------------------
# Extensions are still here ...
options("fastverse.extend")

# Thus attaching the fastverse again will include them
library(fastverse)

## -----------------------------------------------------------------------------
# Detaching and unloading all packages and clearing options
fastverse_detach(session = TRUE, unload = TRUE)

## ---- include=FALSE-----------------------------------------------------------
options(fastverse.styling = .fv_styling)

## -----------------------------------------------------------------------------
options(fastverse.extend = c("dygraphs", "tidyfast"))
library(fastverse)

fastverse_detach(session = TRUE)

## ---- include=FALSE-----------------------------------------------------------
options(fastverse.styling = .fv_styling)

## -----------------------------------------------------------------------------
library(fastverse)

# Adding extensions
fastverse_extend(xts, zoo, roll, dygraphs, permanent = TRUE)

# Removing some core packages
fastverse_detach(data.table, fst, matrixStats, permanent = TRUE)

# Adding data.table again, so it is attached last
fastverse_extend(data.table, permanent = TRUE)

## -----------------------------------------------------------------------------
# This will be the order in which packages are attached
fastverse_packages(include.self = FALSE)

# Check conflicts to make sure data.table functions take precedence
fastverse_conflicts()

## -----------------------------------------------------------------------------
# detach all packages and clear all options
fastverse_detach(session = TRUE)

## ---- include=FALSE-----------------------------------------------------------
options(fastverse.styling = .fv_styling)

## -----------------------------------------------------------------------------
library(fastverse) 

## -----------------------------------------------------------------------------
# Extension for the session
fastverse_extend(Rfast2, coop)

# These packages go here
options("fastverse.extend")

# This fetches packages from both the file and the option
fastverse_packages()

## ---- message=FALSE, warning=FALSE--------------------------------------------
# Recursively determine the joint dependencies of the current fastverse configuration
fastverse_deps(recursive = TRUE) # Returns a data frame

## -----------------------------------------------------------------------------
# Check versions and update status of packages and dependencies
fastverse_sitrep() # default is recursive = FALSE

## -----------------------------------------------------------------------------
fastverse_detach()
options(fastverse.quiet = TRUE)
library(fastverse) # Nothing to see here

# This gives lots of function clashes with data.table, but they are not displayed in quiet mode
fastverse_extend(lubridate)

## -----------------------------------------------------------------------------
# Resetting the fastverse to defaults (clearing all permanent extensions and options)
fastverse_reset()
# Detaching 
fastverse_detach()

