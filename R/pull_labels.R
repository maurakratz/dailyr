#' Save Variable Names and Labels in a List to Restore Them Later
#'
#' @description Extracts variable names and variable labels from a data frame and stores them in a named list, so that labels can be re-applied to the dataframe after wrangling with \code{pull_labels} without losing them (e.g., with dplyr-based operations).
#' @param data A data frame.
#' @return A named list where names are variable names and values are the labels.
#' @export
pull_labels <- function(data) {
  labels_list <- lapply(data, function(x) attr(x, "label"))
  # Nur nicht-leere Labels behalten
  labels_list[!vapply(labels_list, is.null, logical(1))]
}
