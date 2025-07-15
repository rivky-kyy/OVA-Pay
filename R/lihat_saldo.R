#' Lihat Saldo Pengguna
#'
#' Menampilkan saldo terakhir dari pengguna.
#'
#' @param username Nama pengguna
#' @return Saldo pengguna atau pesan error
#' @export
lihat_saldo <- function(username) {
  path <- paste0("data/", username, "_saldo.rds")

  if (!file.exists(path)) {
    return("Saldo 0. Silakan lakukan top up terlebih dahulu.")
  }

  saldo <- readRDS(path)
  saldo_formatted <- format(saldo, big.mark = ".", decimal.mark = ",", scientific = FALSE)

  return(paste("Saldo saat ini:", saldo_formatted))
}
