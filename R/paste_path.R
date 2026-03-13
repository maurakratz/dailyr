#' Get Path from Clipboard and Convert
#'
#' @description Reads text from clipboard and fixes slashes.
#' @return Character string.
#' @export
paste_path <- function() {
  path <- readClipboard()[1] # Take only first element
  convert_path(path)
}
