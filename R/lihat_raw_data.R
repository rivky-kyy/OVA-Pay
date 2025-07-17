raw_data <- data.frame(
  username = c("rivky", "mama", "fahmi"),
  tanggal = as.Date(c("2025-07-14", "2025-07-14", "2025-07-15")),
  amount = c(20000, 10000, 5000),
  jenis_transaksi = c("topup", "pay", "transfer")
)

# Simpan sebagai .rds ke folder data/
usethis::use_data(raw_data, overwrite = TRUE)
