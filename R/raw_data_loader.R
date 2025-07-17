#' Baca Raw Data Pembayaran
#'
#' Fungsi untuk melihat raw data transaksi pembayaran yang dimasukkan ke dalam package.
#'
#' @return Data frame raw transaksi
#' @export
lihat_raw_data <- function() {
  if (exists("raw_data")) {
    return(raw_data)
  } else {
    return("Data belum tersedia.")
  }
}
