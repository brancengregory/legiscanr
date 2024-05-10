#' @export
bill_types <- tibble::tribble(
  ~value, ~type, ~description,
  1, "B", "Bill",
  2, "R", "Resolution",
  3, "CR", "Concurrent Resolution",
  4, "JR", "Joint Resolution",
  5, "JRCA", "Joint Resolution Constitutional Amendment",
  6, "EO", "Executive Order",
  7, "CA", "Constitutional Amendment",
  8, "M", "Memorial",
  9, "CL", "Claim",
  10, "C", "Commendation",
  11, "CSR", "Committee Study Request",
  12, "JM", "Joint Memorial",
  13, "P", "Proclamation",
  14, "SR", "Study Request",
  15, "A", "Address",
  16, "CM", "Concurrent Memorial",
  17, "I", "Initiative",
  18, "PET", "Petition",
  19, "SB", "Study Bill",
  20, "IP", "Initiative Petition",
  21, "RB", "Repeal Bill",
  22, "RM", "Remonstration",
  23, "CB", "Committee Bill"
)

#' @export
event_types <- tibble::tribble(
  ~value, ~description,
  1, "Hearing",
  2, "Executive Session",
  3, "Markup Session"
)

#' @export
political_party <- tibble::tribble(
  ~value, ~description,
  1, "Democrat",
  2, "Republican",
  3, "Independent",
  4, "Green Party",
  5, "Libertarian",
  6, "Nonpartisan"
)

#' @export
roles <- tibble::tribble(
  ~value, ~description,
  1, "Representative / Lower Chamber",
  2, "Senator / Upper Chamber",
  3, "Joint Conference"
)

#' @export
sast_types <- tibble::tribble(
  ~value, ~description,
  1, "Same As",
  2, "Similar To",
  3, "Replaced By",
  4, "Replaces",
  5, "Cross-filed",
  6, "Enabling For",
  7, "Enabled By",
  8, "Related",
  9, "Carry Over"
)

#' @export
sponsor_types <- tibble::tribble(
  ~value, ~description,
  0, "Sponsor (Generic / Unspecified)",
  1, "Primary Sponsor",
  2, "Co-Sponsor",
  3, "Joint Sponsor"
)

#' @export
stance <- tibble::tribble(
  ~value, ~description,
  0, "Watch",
  1, "Support",
  2, "Oppose"
)

#' @export
status <- tibble::tribble(
  ~value, ~description,
  0, "N/A Pre-filed or pre-introduction",
  1, "Introduced",
  2, "Engrossed",
  3, "Enrolled",
  4, "Passed",
  5, "Vetoed",
  6, "Failed Limited support based on state",
  7, "Override Progress array only",
  8, "Chaptered Progress array only",
  9, "Refer Progress array only",
  10, "Report Pass Progress array only",
  11, "Report DNP Progress array only",
  12, "Draft Progress array only"
)

#' @export
supplement_types <- tibble::tribble(
  ~value, ~description,
  1, "Fiscal Note",
  2, "Analysis",
  3, "Fiscal Note/Analysis",
  4, "Vote Image",
  5, "Local Mandate",
  6, "Corrections Impact",
  7, "Miscellaneous",
  8, "Veto Letter"
)

#' @export
text_types <- tibble::tribble(
  ~value, ~description,
  1, "Introduced",
  2, "Committee Substitute",
  3, "Amended",
  4, "Engrossed",
  5, "Enrolled",
  6, "Chaptered",
  7, "Fiscal Note",
  8, "Analysis",
  9, "Draft",
  10, "Conference Substitute",
  11, "Prefiled",
  12, "Veto Message",
  13, "Veto Response",
  14, "Substitute"
)

#' @export
votes <- tibble::tribble(
  ~value, ~description,
  1, "Yea",
  2, "Nay",
  3, "Not Voting / Abstain",
  4, "Absent / Excused"
)
