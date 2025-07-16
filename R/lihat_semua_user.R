#' Melihat Semua User yang Terdaftar (khusus untuk Owner)
#'
#' Fungsi ini akan menampilkan seluruh daftar user yang telah terdaftar di OVA-Pay.
#' Hanya bisa dijalankan oleh akun 'owner'.
#'
#' @param requester Username pemanggil fungsi
#' @return Daftar username atau pesan error
#' @export
lihat_semua_user <- function(requester) {
  if (requester != "owner") {
    return("Akses ditolak: hanya owner yang bisa melihat semua user.")
  }

  files <- list.files("data/", pattern = "\\.rds$", full.names = FALSE)
  user_files <- files[!grepl("_saldo\\.rds$", files)]  # hilangkan saldo
  user_names <- gsub("\\.rds$", "", user_files)        # hapus ekstensi

  return(user_names)
}
