all_meta <- jsonlite::read_json("https://api.github.com/users/hsonne/repos")

keys <- sapply(all_meta, kwb.utils::selectElements, "name") 

meta <- all_meta[! keys %in% c("universe", "mrustl.github.io")]

name_url <- lapply(all_meta, function(x) {
  get <- kwb.utils::createAccessor(x)
  list(package = get("name"), url = get("url"))
})

jsonlite::write_json(name_url, "packages.json", pretty = TRUE, auto_unbox = TRUE)
