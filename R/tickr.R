# #' Tickr class
# #'
# #' Tickr is an S4 class that extends the
#
# #' Create a tickr object
# #'
# #' `tickr()` creates a tickr object with the specified values
# #' @return a tickr object
# #' @export
# #'
# #' @examples
# tickr <- function () {
#    # maybe include:
#    #   # don't track any longer than maxdur seconds or maxdur duration
#    #     maxdur = Integer | Duration
#    #   # no more than maxtbl entries
#    #     maxtbl = Integer
#    #   # recycle = F implies discarding entry when nrow(tbl) > maxtbl
#    #   # recycle = T implies disqueuing* tbl and enqueuing entry into tbl
#    #   # * just made that up: disqueuing - to dequeue and discard an element
#    #   #     from a queue data structure
#    #     recycle = Logical
#    t0 <- lubridate::now()
#    tn <- t0
#    tbl <- tibble::tibble(
#       timestamp=t0
#       , tick = lubridate::dseconds(0)
#       , tock = lubridate::dseconds(0)
#       , msg=as.character(NA))
#    function(msg=NA, as="tick", ...) {
#       # as = {"tick", "tock", "time", "tally", "history"}
#       # time = update and return as now time
#       # tick = update and return as seconds elapsed since start
#       # tock = update and return as seconds elapsed since last function call
#       # msg = update and return formatted msg of form: tick msg (tock)
#       # tally = update and return as tbl listing of captured timings
#       # history = only show listing of timings
#       # TODO: as= generalized tickr token to return
#       # time_msg
#       # tick msg (tock)
#       # tock_msg
#       #
#       if (as == "history") {
#          tbl
#       } else {
#          tm <- lubridate::now()
#          ti <- lubridate::dseconds (lubridate::interval (t0, tm))
#          to <- lubridate::dseconds (lubridate::interval (tn, tm))
#          tn <<- tm
#          tbl <<- add_row(tbl, timestamp=tm, tick=ti, tock=to, msg=msg)
#
#          switch (
#             as
#             , "time" = tm
#             , "tick" = round(ti, 3)
#             , "tock" = round(to, 3)
#             , "tally" = tbl
#             , "msg" = msg
#             , "timto" = sprintf ("%s %s (%s)"
#                                , hms::as.hms(round(ti,3))
#                                , msg
#                                , round(to, 3))
#             , "tim" = sprintf ("%s %s"
#                                , hms::as.hms(round(ti,3))
#                                , msg
#                                ))
#       }
#    }
#    # Consider the following:
#    # ```
#    # > txs <- tick(as="history")
#    # > summary(txs[, "tock"])
#    # #      tock
#    # # Min.   :0s
#    # # 1st Qu.:4.59867423772812s
#    # # Median :5.09601306915283s
#    # # Mean   :29.7755694389343s
#    # # 3rd Qu.:17.1664128303528s
#    # # Max.   :245.670374631882s (~4.09 minutes)
#    # ```
#    # We can speak of the "fastest half", "middle/typical half", and "slowest
#    #   half" by considering the summary (Min:Median), summary (1st Qu.:3rd Qu.),
#    #   and summary (Mean:Max.), respectively.
#    # This seems, intuitively speaking, more useful to me for analyzing perceived
#    # performance by a human.  Perhaps worthy of further consideration at some
#    # point.
# }
#
# inform <- function(...) {
#    paste ("Informational message:", ...)
# }
#
# warn <- function(...) {
#    paste ("Warning message: !!", ..., "!!")
# }
#
# #ledgerize <- function(, drs, crs...) {
# #
# #}
#
# # Logging convenience functions
# tickr <- new_tickr()
# tick <- function (msg) {
#    tickr (as="tim", msg=msg)
# }
# tock <- function (msg) {
#    tickr (as="timto", msg=msg)
# }
# #ticktocks <- tibble()
#
#