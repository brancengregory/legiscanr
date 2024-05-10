library(legiscanr)
library(tidyverse)
library(tidygraph)
library(ggraph)
library(visNetwork)

bills <- get_master_list(state = "OK")

bills |>
  filter(
    last_action_date >= "2024-01-01",
    status > 1
  )

sponsor_network <- bills |>
  mutate(
    sponsor = map(
      bill_id,
      ~ bill_sponsors(.x) |>
        bind_rows(),
      .progress = TRUE
    )
  ) |>
  unnest(
    cols = "sponsor"
  )

sponsor_nodes <- sponsor_network |>
  select(people_id, name, party) |>
  distinct() |>
  mutate(node_type = "sponsor")

bill_nodes <- bills |>
  select(bill_id, name = number, status = status) |>
  distinct() |>
  mutate(
    node_type = "bill"
  )

nodes <- bill_nodes |>
  bind_rows(sponsor_nodes) |>
  mutate(
    node_index = row_number()
  )

edges <- sponsor_network |>
  distinct(bill_id, people_id) |>
  left_join(nodes, by = c("bill_id"), suffix = c("", "_drop")) |>
  rename(from = node_index) |>
  left_join(nodes, by = c("people_id"), suffix = c("", "_drop")) |>
  rename(to = node_index) |>
  distinct(from, to)

graph <- tbl_graph(
  nodes = nodes,
  edges = edges,
  directed = FALSE
)

graph |>
  ggraph(layout = "fr")

nodes_vis <- nodes |>
  select(id = node_index, label = name, group = node_type)

edges_vis <- edges |>
  select(from, to)

visNetwork(nodes_vis, edges_vis) |>
  visNodes(shape = 'dot') |>
  visLayout(randomSeed = 123)
