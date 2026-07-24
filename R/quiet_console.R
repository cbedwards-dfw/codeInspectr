
## redirect streams to suppress subprocess-level noise, like when building vignettes.
quiet_console <- function(expr) {
  out_con <- file(tempfile(), open = "wt")
  msg_con <- file(tempfile(), open = "wt")

  sink(out_con, type = "output")
  sink(msg_con, type = "message")

  on.exit({
    sink(type = "message")
    sink(type = "output")
    close(out_con)
    close(msg_con)
  }, add = TRUE)

  force(expr)
}
