#' Login User
#'
#' Fungsi untuk memverifikasi login user berdasarkan username dan password.
#'
#' @param username Nama pengguna
#' @param password Kata sandi
#' @return Pesan status login
#' @export
login_user <- function(username, password) {
  path <- paste0("data/", username, ".rds")

  if (!file.exists(path)) {
    return("Akun tidak ditemukan.")
  }

  user_data <- readRDS(path)

  if (user_data$password == password) {
    return("Login berhasil.")
  } else {
    return("Password salah.")
  }
}
