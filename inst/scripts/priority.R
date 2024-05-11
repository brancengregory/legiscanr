library(legiscanr)
library(tidyverse)
library(here)
library(janitor)
library(tidygraph)
library(ggraph)

notion_data <- read_csv(here("inst", "data", "notion", "Bills 1c030ec0de26400e82db8c915a63ed65.csv")) |>
  clean_names()


data <- get_master_list(state = "OK") |>
  left_join(
    notion_data |>
      mutate(
        number = str_remove_all(bill_number, "\\s") |>
          str_replace_all("\\(.*\\)", "")
      ),
    by = c("number" = "number")
  )

data |>
  count(status, position) |>
  left_join(
    status,
    by = c("status" = "value")
  ) |>
  mutate(
    .by = status,
    ratio = n / sum(n)
  )

priority_authors <- data |>
  filter(
    !is.na(position)
  ) |>
  mutate(
    sponsors = map(
      bill_id,
      ~ bill_sponsors(.x) |>
        select(people_id, name, party) |>
        distinct(),
      .progress = TRUE
    )
  )

graph_data <- priority_authors |>
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
