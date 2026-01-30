#' Convert Path and Create Missing Directories
#'
#' @description Normalizes slashes and creates the folder structure if missing.
#' @param path Character string. The raw path (use raw strings or escaped backslashes).
#' @return The converted path with forward slashes.
#' @export
convert_path <- function(path) {
  path <- trimws(path) # Remove leading/trailing whitespace
  path <- gsub("\\\\", "/", path) # Fix slashes

  folder_path <- dirname(path)

  if (!dir.exists(folder_path)) {
    dir.create(folder_path, recursive = TRUE)
    message(paste("Created missing directory:", folder_path))
  }

  return(path)
}
