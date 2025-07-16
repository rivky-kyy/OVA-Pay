# Instalasi package devtools dan usethis (jika belum)
install.packages(c("devtools", "usethis", "roxygen2"))

# Buat package baru
usethis::create_package("C:\\Users\\Lenovo\\Documents\\Kuliah UII\\Semester 4\\Prak Komputasi Statistika (Komstat)\\OVAPay")

remove.packages("OVAPay")

devtools::load_all()
devtools::document()
devtools::install()
