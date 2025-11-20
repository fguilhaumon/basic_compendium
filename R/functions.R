#' Download Species Richness Data from Williams et al. 2024
#'
#' @param taxon (bird, mamm) the taxon for which data are downloaded
#' 
#' @return the path to the downloaded file
#' @export
#'
download_sr <- function(taxon) {
  
  ## Inform about the data being downloaded
  message("# ---- Downloading data for taxon: ", taxon)
  
  ## File name ----
  if (taxon == "bird") filename <- "bird_SR_cells.csv"
  if (taxon == "mamm") filename <- "mamm_SR_cells.csv"
  
  ## GitHub directory URL ----
  url <- "https://raw.githubusercontent.com/pwilliams0/Biogeography_and_global_diversity/refs/heads/main/Data/"
  
  ## Complete file url ----
  file_url <- paste0(url, filename)
  
  ## Destination ---- 
  dest_dir  <- "data"
  dest_path <- file.path(dest_dir, filename)
  
  ## Download file ----
  utils::download.file(url      = file_url,
                       destfile = dest_path,
                       mode     = "wb")
  
  return(dest_path)
  
}