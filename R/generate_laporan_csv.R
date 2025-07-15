#' Generate Laporan Transaksi dalam Format CSV
#'
#' Membuat file CSV dari riwayat transaksi pengguna.
#'
#' @param username Nama pengguna
#' @return Pesan status
#' @export
generate_laporan_csv <- function(username) {
  path <- paste0("data/", username, "_transaksi.csv")

  if (!file.exists(path)) {
    return("Tidak ada transaksi yang bisa dilaporkan.")
  }

  laporan <- read.csv(path)
  output_path <- paste0("data/", username, "_laporan.csv")
  write.csv(laporan, output_path, row.names = FALSE)

  return(paste("Laporan berhasil disimpan sebagai", output_path))
}
