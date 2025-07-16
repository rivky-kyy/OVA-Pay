#' Top Up Saldo User
#'
#' Fungsi untuk menambahkan saldo ke akun user
#'
#' @param username Nama pengguna
#' @param amount Jumlah yang akan ditambahkan
#' @return Pesan konfirmasi top-up
#' @export
topup <- function(username, amount) {
  saldo_path <- paste0("data/", username, "_saldo.rds")

  # Jika belum ada, buat saldo awal = 0
  if (!file.exists(saldo_path)) {
    saldo <- 0
  } else {
    saldo <- readRDS(saldo_path)
  }

  saldo <- saldo + amount
  saveRDS(saldo, saldo_path)

  # Format nilai top-up (bukan saldo akhir)
  amount_formatted <- format(amount, big.mark = ".", decimal.mark = ",", scientific = FALSE)

  return(paste("Top up berhasil sebesar", amount_formatted))
}
