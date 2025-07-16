#' Melakukan Pembayaran Tagihan
#'
#' Fungsi untuk melakukan pembayaran dari saldo user.
#'
#' @param username Nama pengguna
#' @param amount Jumlah pembayaran
#' @param keterangan Deskripsi pembayaran
#' @return Pesan status pembayaran
#' @export
pay <- function(username, amount, keterangan = "") {
  saldo_path <- paste0("data/", username, "_saldo.rds")

  if (!file.exists(saldo_path)) {
    return("Akun tidak ditemukan.")
  }

  saldo <- readRDS(saldo_path)

  if (saldo < amount) {
    return("Saldo tidak mencukupi untuk pembayaran.")
  }

  saldo <- saldo - amount
  saveRDS(saldo, saldo_path)

  # Catat ke transaksi
  transaksi <- data.frame(
    Username = username,
    Amount = amount,
    Keterangan = paste("Tagihan:", keterangan),
    Waktu = format(Sys.time(), "%Y-%m-%d %H:%M:%S")
  )

  transaksi_path <- paste0("data/", username, "_transaksi.csv")
  if (file.exists(transaksi_path)) {
    old <- read.csv(transaksi_path)
    transaksi <- rbind(old, transaksi)
  }
  write.csv(transaksi, transaksi_path, row.names = FALSE)

  return(paste("Pembayaran sebesar", amount, "berhasil untuk", keterangan))
}
