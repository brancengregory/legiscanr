devtools::load_all()
library(tidyverse)
library(skimr)

status_lookup <- read_csv("inst/legiscan_static_lookup_tables/status.csv")
event_lookup <- read_csv("inst/legiscan_static_lookup_tables/event_type.csv")

data <- get_master_list(state = "ok") |>
  mutate(
    across(
      ends_with("_date"),
      ymd
    )
  ) |>
  left_join(
    status_lookup,
    by = c("status" = "status_id")
  )

data |>
  skim()

data |>
  count(status_desc, status, sort = T)

data |>
  ggplot(aes(x = last_action_date, y = 1)) +
    geom_point()

data |>
  filter(last_action_date >= "2024-01-01") |>
  ggplot(aes(x = last_action_date, y = 1)) +
    geom_point()

data |>
  filter(status_date >= "2024-01-01") |>
  ggplot(aes(x = status_date, y = 1)) +
    geom_point()

bill_data <- data |>
  filter(
    last_action_date >= "2024-01-01",
    status == 2
  ) |>
  mutate(
    bill_details = map(bill_id, get_bill)
  )

hb1006 <- get_bill("1788294")

hb1006 |>
  discard(is_list) |>
  enframe() |>
  pivot_wider() |>
  mutate(
    across(
      everything(),
      unlist
    )
  ) |>
  View()

remainder <- hb1006 |>
  discard(~ !is_list(.x))

bill_session <- remainder$session

bill_progress <- remainder$progress |>
  map(as_tibble) |>
  list_rbind() |>
  left_join(
    event_lookup,
    by = c("event" = "event_type_id")
  )

bill_referrals <- remainder$referrals |>
  map(as_tibble) |>
  list_rbind()

bill_history <- remainder$history |>
  map(as_tibble) |>
  list_rbind()

bill_sponsors <- remainder$sponsors |>
  map(as_tibble) |>
  list_rbind()

bill_sasts <- remainder$sasts |>
  map(as_tibble) |>
  list_rbind()

bill_texts <- remainder$texts |>
  map(as_tibble) |>
  list_rbind()

bill_votes <- remainder$votes |>
  map(as_tibble) |>
  list_rbind()

bill_supplements <- remainder$supplements |>
  map(as_tibble) |>
  list_rbind()

bill_subjects <- remainder$subjects
bill_amendments <- remainder$amendments
bill_calendar <- remainder$calendar
bill_committee <- remainder$committee
