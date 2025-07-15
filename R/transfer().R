#' Transfer Saldo ke User Lain
#'
#' Fungsi untuk mentransfer saldo dari satu user ke user lain (sesama OVA-Pay).
#'
#' @param from_user Nama pengirim
#' @param to_user Nama penerima
#' @param amount Jumlah saldo yang ditransfer
#' @return Pesan status transfer
#' @export
transfer <- function(from_user, to_user, amount) {
  from_path <- paste0("data/", from_user, "_saldo.rds")
  to_path <- paste0("data/", to_user, "_saldo.rds")

  if (!file.exists(from_path)) return("Akun pengirim tidak ditemukan.")
  if (!file.exists(to_path)) return("Akun penerima tidak ditemukan.")

  from_saldo <- readRDS(from_path)
  to_saldo <- readRDS(to_path)

  if (from_saldo < amount) {
    return("Saldo tidak mencukupi.")
  }

  from_saldo <- from_saldo - amount
  to_saldo <- to_saldo + amount

  saveRDS(from_saldo, from_path)
  saveRDS(to_saldo, to_path)

  return(paste("Transfer berhasil sebesar", amount, "dari", from_user, "ke", to_user))
}
