library(legiscanr)
library(tidyverse)
library(vistime)


bill <- bill("1788361")

data <- bill |>
  bill_progress() |>
  left_join(
    status,
    by = c(
      "event" = "value"
    )
  )

data |>
  mutate(
    end = date,
    start = lag(end, default = "2023-02-01"),
    event = description
  ) |>
  vistime::gg_vistime(optimize_y = FALSE)
