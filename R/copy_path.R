#' Get Path from Clipboard and Convert
#'
#' @description Reads text from clipboard and fixes slashes.
#' @return Character string.
#' @export
paste_path <- function() {
  path <- readClipboard()
  convert_path(path) # Re-use the logic from convert_path
}
