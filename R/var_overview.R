#' Overview of Variable Names, Labels and Classes in a Dataset
#'
#' @description Returns a clean table of variable names, classes, and labels.
#' Replaces NULL labels with NA.
#'
#' @param data A data frame or tibble.
#' @return A tibble with columns: variable, class, label.
#' @export
describe_vars <- function(data) {
  # Wir nutzen hier tibble::tibble für eine saubere Ausgabe
  tibble::tibble(
    variable = names(data),

    # Klasse extrahieren (bei mehreren Klassen mit Komma trennen)
    class = vapply(data, function(x) paste(class(x), collapse = ", "), character(1)),

    # Label extrahieren (NULL sicher in NA umwandeln)
    label = vapply(data, function(x) {
      lbl <- attr(x, "label")
      if (is.null(lbl)) NA_character_ else as.character(lbl)
    }, character(1))
  )
}
