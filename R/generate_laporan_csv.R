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
    return("Tidak ada riwayat transaksi.")
  }

  data <- read.csv(path)

  # Format kolom Amount menjadi ribuan dengan titik
  data$Amount <- format(data$Amount, big.mark = ".", decimal.mark = ",", scientific = FALSE)

  # Simpan ulang dengan format yang sudah diubah
  laporan_path <- paste0("data/", username, "_laporan.csv")
  write.csv(data, laporan_path, row.names = FALSE)

  return(paste("Laporan transaksi berhasil dibuat:", laporan_path))
}
