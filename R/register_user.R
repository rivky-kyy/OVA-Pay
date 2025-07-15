#' Register User
#'
#' Fungsi untuk registrasi user baru.
#' @param username Nama pengguna.
#' @param password Kata sandi.
#' @return Pesan status.
#' @export
register_user <- function(username, password) {
  # Buat folder data jika belum ada
  if (!dir.exists("data")) {
    dir.create("data")
  }

  filepath <- paste0("data/", username, ".rds")

  if (file.exists(filepath)) {
    return("Username sudah terdaftar.")
  }

  user_data <- list(username = username, password = password)
  saveRDS(user_data, filepath)

  return("Registrasi berhasil.")
}
