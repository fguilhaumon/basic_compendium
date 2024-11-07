######################################################
# basic_compendium
# make.R 
# francois.guilhaumon@ird.fr
######################################################

## add sub-directories ----
reps <- c("R", "outputs")
lapply(reps, dir.create)

# load project functions ----
devtools::load_all()

# convert williams et al. 2024 pdf to a png panel ----
pdf_to_pngs() |> pngs_to_panel()

# compile the tutorial
quarto::quarto_render(input = "index.qmd")
