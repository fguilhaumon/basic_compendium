

#' Convert a PDF to Several PNGs (One Per Page)
#'
#' @param pdf_path the path to the pdf file to convert
#'
#' @return the paths to the png files created (in outputs/)
#' @export
#'
pdf_to_pngs <- function(pdf_path = "references/williams_natcom_2024.pdf") {
  
  # read the pdf ----
  pdf <- magick::image_read_pdf(pdf_path)
  
  #change size
  
  pdf <- magick::image_scale(pdf, "150")
  
  # get the basename
  pdf_name <- basename(pdf_path)
  
  # remove the file extension
  pdf_name <- sub(".pdf", "", pdf_name)
  
  # saving each page of the pdf as a png ----
  
  png_paths <- sapply(1:length(pdf), function(i) {
    
    magick::image_write(pdf[i], path = paste0("outputs/", pdf_name, "_", i, ".png"), format = "png")
    
  })
  
  return(png_paths)
  
}

#' Convert Several PNGs to a PNG panel
#'
#' @param png_paths the paths to the png files to convert
#'
#' @return the path to the png panel created
#' @export
#'
pngs_to_panel <- function(png_paths) {
  
  pngs <- magick::image_read(png_paths)
  
  png_panel <- magick::image_montage(pngs, tile = "5x2")
  
  png_panel_path <- sub("_1", "", png_paths[1])
  
  magick::image_write(png_panel, path = png_panel_path, format = "png")
  
  return(png_panel_path)
  
}
