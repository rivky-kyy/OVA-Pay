#' Buat Pemesanan dan Simpan ke Riwayat Transaksi
#'
#' Fungsi untuk mensimulasikan pemesanan barang/jasa.
#'
#' @param username Nama pengguna
#' @param amount Total biaya pemesanan
#' @param item Nama item/barang/jasa
#' @return Pesan status pemesanan
#' @export
create_order <- function(username, amount, item) {
  saldo_path <- paste0("data/", username, "_saldo.rds")
  transaksi_path <- paste0("data/", username, "_transaksi.csv")

  if (!file.exists(saldo_path)) {
    return("Akun tidak ditemukan.")
  }

  saldo <- readRDS(saldo_path)
  if (saldo < amount) {
    return("Saldo tidak mencukupi untuk pemesanan.")
  }

  saldo <- saldo - amount
  saveRDS(saldo, saldo_path)

  transaksi <- data.frame(
    username = username,
    amount = amount,
    keterangan = paste("Pemesanan:", item),
    waktu = format(Sys.time(), "%Y-%m-%d %H:%M:%S")
  )

  if (file.exists(transaksi_path)) {
    lama <- read.csv(transaksi_path)
    transaksi <- rbind(lama, transaksi)
  }
  write.csv(transaksi, transaksi_path, row.names = FALSE)

  return(paste("Pemesanan untuk", item, "berhasil."))
}
