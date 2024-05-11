library(legiscanr)
library(tidyverse)
library(here)
library(janitor)
library(tidygraph)
library(ggraph)


data <- get_master_list(state = "OK") |>
  mutate(
    sponsors = map(
      bill_id,
      ~ bill_sponsors(.x),
      .progress = TRUE
    )
  )



graph_data <- data |>
  unnest(
    cols = sponsors
  ) |>
  select(
    bill_number,
    name,
    party,
    position
  )

bill_nodes <- graph_data |>
  distinct(bill_number) |>
  mutate(
    bill_number,
    type = "bill"
  )

author_nodes <- graph_data |>
  distinct(name) |>
  mutate(
    type = "author"
  )

nodes <- bill_nodes |>
  bind_rows(author_nodes) |>
  mutate(
    node_index = row_number()
  )

edges <- graph_data |>
  left_join(
    nodes,
    by = c("bill_number" = "bill_number"),
    suffix = c("", "_drop")
  ) |>
  rename(
    from = node_index
  ) |>
  left_join(
    nodes,
    by = c("name" = "name")
  ) |>
  rename(
    to = node_index
  ) |>
  distinct(from, to)

graph <- tbl_graph(
  nodes = nodes,
  edges = edges,
  directed = FALSE
) |>
  mutate(
    degree = centrality_degree(),
    alpha = centrality_alpha(),
    closeness = centrality_closeness(),
    betweenness = centrality_betweenness(),
    eigenvector = centrality_eigen(),
    pagerank = centrality_pagerank(),
    hub = centrality_hub(),
    authority = centrality_authority(),
    group_edge_betweenness = group_edge_betweenness()
  )

graph |>
  ggraph("fr") +
  geom_edge_link(alpha = 0.2) +
  geom_node_point(aes(size = eigenvector)) +
  geom_node_text(aes(label = name), repel = TRUE, size = 3) +
  theme_graph() +
  labs(
    title = "Priority Authors",
    subtitle = "Oklahoma Legislation",
    caption = "Data from LegiScan and Notion"
  )

# Make node size proportional to centrality
as_tbl_graph(graph_data, directed = FALSE) |>
  ggraph("fr") +
  geom_edge_link(aes(color = position)) +
  geom_node_point(aes(size = centrality_degree())) +
  geom_node_text(aes(label = name), repel = TRUE, size = 3) +
  theme_graph() +
  labs(
    title = "Priority Authors",
    subtitle = "Oklahoma Legislation",
    caption = "Data from LegiScan and Notion"
  )
