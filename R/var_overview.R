#' Overview of all Variables in a Dataset
#'
#' @description Returns a clean table of variable names, classes, labels, and example values.
#' Prints 100 rows by default.
#'
#' @param data A data frame or tibble.
#' @return Invisibly returns the tibble.
#' @export
var_overview <- function(data) {
  # Helper function to generate the example string based on type
  get_example <- function(x) {
    if (all(is.na(x))) return("All NA")
    x_clean <- stats::na.omit(x)

    # 1. Check for Dummy (Numeric/Integer with only 0 and 1)
    if (is.numeric(x) && all(unique(x_clean) %in% c(0, 1))) {
      return("0 / 1 (Dummy)")
    }

    # 2. Check for Numeric or Date -> Range
    if (is.numeric(x) || inherits(x, "Date") || inherits(x, "POSIXt")) {
      rng <- range(x_clean)
      # Format nicely: "Min - Max"
      return(paste(rng[1], "-", rng[2]))
    }

    # 3. Character, Factor, Logical -> List first few unique values
    vals <- head(unique(x_clean), 3)
    ex_str <- paste(vals, collapse = ", ")

    # Add "..." if there are more values
    if (length(unique(x_clean)) > 3) {
      ex_str <- paste0(ex_str, ", ...")
    }

    return(ex_str)
  }

  res <- tibble::tibble(
    variable = names(data),
    class = vapply(data, function(x) paste(class(x), collapse = ", "), character(1)),
    label = vapply(data, function(x) {
      lbl <- attr(x, "label")
      if (is.null(lbl)) NA_character_ else as.character(lbl)
    }, character(1)),
    example = vapply(data, get_example, character(1))
  )

  print(res, n = 100)
  invisible(res)
}
