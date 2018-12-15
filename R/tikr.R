check_tikr <- function(object) {
   if (is (object@t0, "POSIXct"))
      TRUE
   else
      "Start time must be in POSIXct format."
}

setClass(
   "Tikr"
   , contains = c ("numeric")
   , slots = c (t0 = "numeric")
   , prototype (t0 = lubridate::now())
   , validity = check_tikr)


is.tikr <- function (x) is (x, "Tikr")

tikr <- function (t0 = NULL) {
   t0 <- ifelse (is.null(t0), lubridate::now(), t0)
   new ("Tikr", t0)
}

