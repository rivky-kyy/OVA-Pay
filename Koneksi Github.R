devtools::install_github("hadley/pkgdown")
library(pkgdown)
pkgdown::build_site()

setwd("C:\\Users\\Lenovo\\Documents\\Kuliah UII\\Semester 4\\Prak Komputasi Statistika (Komstat)\\OVAPay")
##usethis::git_sitrep()
usethis::use_git()

system("git --version")
system("git status")

system("git config --list", intern = TRUE)
system('git config user.name "imtikhanis"')
system('git config user.email "andhika.4929@gmail.com"')


#system("git remote add origin https://github.com/rivky-kyy/OVA-Pay.git")# digunakan jika github baru mau dikoneksikan
system("git remote set-url origin https://github.com/rivky-kyy/OVA-Pay.git")
system("git branch -M main")
system("git push -u origin main")


#Menghubungkan R Package dengan Github
system("git add .")
system('git commit -m "Initial commit"')
system("git push origin main")


#Verifikasi koneksi
system("git log --oneline")
system("git branch")


devtools::install_github("rivky-kyy/OVA-Pay")

