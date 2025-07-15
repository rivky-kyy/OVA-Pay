help(package = "OVAPay")

library(OVAPay)

# Register akun baru
register_user("rivky", "0987")

# Cek apakah user sudah terdaftar
validasi_user("mama")

# Login user (opsional, jika ada fungsi login_user)
login_user("rivky", "1234")

# Top up saldo
topup("mama", 10000)

# Lihat saldo setelah top up
lihat_saldo("fahmi")

# Buat pemesanan
create_order("rivky", 19, "PPPPPPP")

# Membayar pemesanan
pay("rivky", 5000, "UUUUUUUU")

# Lakukan transfer ke rekening bank
transfer_bank("mama", 10, "Bank Mandiri")

# Generate laporan transaksi ke CSV
generate_laporan_csv("rivky")

# Coba transfer ke user lain
transfer("mama", "rivky", 5000)

