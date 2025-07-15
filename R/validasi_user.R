#' Validasi User Terdaftar
#'
#' Mengecek apakah user dengan username tertentu sudah terdaftar.
#'
#' @param username Nama pengguna
#' @return TRUE jika terdaftar, FALSE jika tidak
#' @export
validasi_user <- function(username) {
  path <- paste0("data/", username, ".rds")
  return(file.exists(path))
}
