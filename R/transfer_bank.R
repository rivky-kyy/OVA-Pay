#' Transfer ke Rekening Bank
#'
#' Melakukan simulasi transfer ke rekening bank dari saldo pengguna.
#'
#' @param username Nama pengguna
#' @param amount Jumlah uang yang ditransfer
#' @param bank Tujuan bank (karakter)
#' @return Pesan status transfer
#' @export
transfer_bank <- function(username, amount, bank) {
  saldo_path <- paste0("data/", username, "_saldo.rds")

  if (!file.exists(saldo_path)) {
    return("Akun tidak ditemukan.")
  }

  saldo <- readRDS(saldo_path)
  if (saldo < amount) {
    return("Saldo tidak mencukupi.")
  }

  saldo <- saldo - amount
  saveRDS(saldo, saldo_path)

  return(paste("Transfer ke bank", bank, "berhasil sebesar", amount))
}
