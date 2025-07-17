help(package = "OVAPay")

library(OVAPay)

# Register akun baru
register_user("papa", "0987")

# Cek apakah user sudah terdaftar
validasi_user("papa")

# Login user
login_user("papa", "0987")

# Top up saldo
topup("papa", 10000)

# Lihat saldo setelah top up
lihat_saldo("papa")

# Buat pemesanan
create_order("papa", 1000, "Rumah")

# Membayar pemesanan
pay("papa", 1000, "Rumah")

# Lakukan transfer ke rekening bank
transfer_bank("papa", 1000, "Bank Mandiri")

# Generate laporan transaksi ke CSV
generate_laporan_csv("papa")

# Coba transfer ke user lain
transfer("papa", "mama", 2000)

# Lihat semua user yang terdaftar
lihat_semua_user("owner")

# Hapus akun
hapus_akun("papa","0987")

# Raw data
raw <- lihat_raw_data()

for (i in 1:nrow(raw)) {
  user <- raw$username[i]
  jumlah <- raw$amount[i]
  jenis <- raw$jenis_transaksi[i]

  if (jenis == "topup") {
    topup(user, jumlah)

  } else if (jenis == "pay") {
    pay(user, jumlah, "Pembayaran dari raw data")

  } else if (jenis == "transfer") {

    transfer(user, "rivky", jumlah)
  }
}

