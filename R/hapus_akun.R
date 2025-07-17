#' Hapus Akun
#'
#' Fungsi untuk menghapus akun dan seluruh datanya (saldo, transaksi, laporan).
#'
#' @param username Nama pengguna
#' @param password Kata sandi pengguna
#' @return Pesan status
#' @export
  hapus_akun <- function(username, password) {
  path <- paste0("data/", username, ".rds")

  if (!file.exists(path)) {
    return("Akun tidak ditemukan.")
  }

  user_data <- readRDS(path)
  stored_pw <- user_data$password[1]  # Ambil password dari data frame

  if (stored_pw != password) {
    return("Password salah.")
  }

  # Hapus semua file terkait user
  file.remove(paste0("data/", username, ".rds"))
  file.remove(paste0("data/", username, "_saldo.rds"))
  file.remove(paste0("data/", username, "_transaksi.csv"))
  file.remove(paste0("data/", username, "_laporan.csv"))

  return(paste("Akun", username, "berhasil dihapus beserta semua datanya."))
}
