StudyLog – Flutter Practical Project

StudyLog merupakan aplikasi pencatatan materi perkuliahan berbasis Flutter yang dikembangkan untuk memenuhi tugas Praktikum Pemrograman Mobile, khususnya Milestone 1.

⸻

1. Deskripsi Aplikasi

Aplikasi StudyLog memungkinkan pengguna memasukkan dan menampilkan catatan perkuliahan melalui form input. Informasi yang dimasukkan meliputi mata kuliah, judul catatan, topik, dan isi catatan.

Data yang telah diisi akan ditampilkan dalam bentuk Card dan disimpan sementara di dalam memori aplikasi. Data tidak tersimpan secara permanen sehingga akan hilang ketika aplikasi dihentikan sepenuhnya.

⸻

2. Fitur Utama

* Form Input Catatan: Memasukkan mata kuliah, judul, topik, dan isi catatan.
* Validasi Input: Memastikan seluruh kolom wajib diisi.
* Validasi Spasi: Menolak input yang hanya berisi spasi.
* Validasi Topik: Memastikan topik memenuhi panjang minimal yang ditentukan.
* Tampilan Card: Menampilkan hasil catatan dalam bentuk Card.
* Pembaruan Judul: Memungkinkan pengguna memperbarui judul catatan.
* SnackBar: Menampilkan notifikasi setelah data berhasil ditampilkan.
* State Management: Menggunakan setState() untuk memperbarui tampilan aplikasi.

⸻

3. Teknologi yang Digunakan

Teknologi	Kegunaan
Flutter	Framework pengembangan aplikasi
Dart	Bahasa pemrograman
Visual Studio Code	Code editor
Android Emulator	Menjalankan dan menguji aplikasi

⸻

4. Cara Menjalankan Aplikasi

Pastikan Flutter SDK sudah terpasang dan perangkat Android Emulator tersedia.

Langkah 1. Buka folder proyek milestone_01_form melalui Visual Studio Code.

Langkah 2. Buka terminal dan jalankan perintah berikut untuk mengunduh dependencies:

flutter pub get

Langkah 3. Jalankan aplikasi menggunakan perintah:

flutter run

⸻

5. Pengujian Aplikasi

Pengujian dilakukan untuk memastikan seluruh fitur berjalan sesuai dengan kebutuhan dan spesifikasi aplikasi.

Metode pengujian yang digunakan:

* Functional Testing: Menguji fungsi form, validasi input, tombol, dan tampilan Card.
* Widget Testing: Menguji perilaku komponen aplikasi menggunakan Flutter Test.
* Static Analysis: Memeriksa kualitas kode menggunakan Flutter Analyze.
* Manual Testing: Menguji aplikasi secara langsung melalui Android Emulator.

Perintah pengujian:

flutter analyze
flutter test

⸻

6. Struktur Proyek

## 6. Struktur Proyek

Struktur folder utama aplikasi StudyLog Milestone 1:

```text
milestone_01_form/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── linux/
├── macos/
├── test/
│   └── widget_test.dart
├── web/
├── windows/
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
└── README.md

⸻

---## 7. Anggota Kelompok

| No. | Nama Lengkap | NIM |
| --- | --- | --- |
| 1 | Erica Nabila Putri | 2411002 |
| 2 | Salsabila Adnina Hadi | 2411022 |
| 3 | Humaira Rizki Ramadhani | 2411094 |
| 4 | Evi Suraidah | 2411095 |
| 5 | Shofwan Alvino Putra Setiawan | 2411097 |



*Praktikum Pemrograman Mobile – Milestone 1*

Repository ini merupakan bagian dari pengerjaan proyek StudyLog menggunakan Flutter.