
<!-- README.md is generated from README.Rmd. Please edit that file -->

# legiscanr

<!-- badges: start -->
<!-- badges: end -->

legiscanr is an R package designed to simplify the process of accessing
and interacting with the LegiScan API, enabling users to easily retrieve
legislative data. This package leverages the tidyverse conventions and
aims to provide a user-friendly interface for querying legislative
information, including bill status, legislative sessions, and more.

## Features

- Easy Authentication: Set your LegiScan API key once, and legiscanr
  handles the rest.
- Tidy Results: Every query returns a tibble, making it easy to
  integrate with the tidyverse suite of packages.
- Comprehensive Coverage: Access data on bills, votes, legislators, and
  more, across all states and at the federal level.

## Installation

You can install the latest version of legiscanr from GitHub. Ensure that
you have the pak package installed, then install legiscanr:

``` r
pak::pak("brancengregory/legiscanr")
```

## Usage

Before using legiscanr, you need to obtain an API key from LegiScan. Set
this key in your R environment to ensure seamless integration.

### Setting API Key

``` r
Sys.setenv(LEGISCAN_API_KEY = "your_api_key_here")
```

### Basic Example

The following example demonstrates how to retrieve a list of legislative
sessions for a given state:

``` r
library(legiscanr)

sessions <- get_session_list(state = "OK")
```

This function call returns a tibble containing information on
legislative sessions in Oklahoma. Each function within legiscanr is
designed to return data in a tidy format, adhering to the principles of
the tidyverse.
