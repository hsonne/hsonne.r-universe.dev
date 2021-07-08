all_meta <- jsonlite::read_json("https://api.github.com/users/hsonne/repos")

keys <- sapply(all_meta, kwb.utils::selectElements, "name") 

meta <- all_meta[! keys %in% c(
  "codemetar",
  "fine", 
  "flusshygiene-opencpu-base",
  "ggplot2",
  "haus-vom-nikolaus",
  "mietspiegel",
  "mrustl.github.io",
  "pFromGrADS",
  "pptmerge",
  "r2r",
  "rain",
  "Testprojekt_01",
  "universe",
  "xtruso_R"
)]

name_url <- lapply(meta, function(x) {
  get <- kwb.utils::createAccessor(x)
  list(package = get("name"), url = get("url"))
})

jsonlite::write_json(name_url, "packages.json", pretty = TRUE, auto_unbox = TRUE)
