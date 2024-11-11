TUGAS DASAR STATE MANAGEMENT

![image](https://github.com/user-attachments/assets/e81c7d12-f1f4-410b-9ae6-f1f264eab5f4)

DOSEN PENGAMPU:
SEPYAN PURNAMA KRISTANTO, S.KOM.,M.KOM

DIBUAT OLEH:
Syafiq Burhanuddin 
(362358302068)
2A TRPL


PRODI TEKNOLOGI REKAYASA PERANGKAT LUNAK
JURUSAN BISNIS DAN INFORMATIKA
POLITEKNIK NEGERI BANYUWANGI
2024




Praktikum 1
Hasilnya
![WhatsApp Image 2024-11-11 at 09 38 40_3af2e37d](https://github.com/user-attachments/assets/985026c4-4fb4-4d3d-8f3c-534e97428a05)
Tugas praktikum 1
2.Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?
Langkah 4 di praktikum ini kemungkinan terkait dengan penambahan data atau perubahan pada struktur data (seperti daftar rencana atau plan). Langkah ini bertujuan untuk memastikan aplikasi dapat menangani input dan menambahkannya ke dalam daftar rencana yang ada, seperti menggunakan fungsi untuk menambah item baru pada list atau menerapkan perubahan pada data yang sudah ada.
Mengapa dilakukan demikian yaitu Langkah ini memastikan bahwa aplikasi dapat berinteraksi dengan data secara dinamis. Pengguna bisa menambahkan item (rencana) ke dalam aplikasi, yang sangat penting untuk fitur aplikasi yang bersifat dinamis. Hal ini juga menguji bagaimana aplikasi mengelola state dan memperbarui tampilan UI berdasarkan perubahan data.

3.Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?
Pada langkah 6, yaitu membuat objek Plan yang digunakan untuk menambahkan rencana baru ke dalam aplikasi. Variabel plan diperlukan untuk menyimpan objek rencana yang baru dibuat sebelum ditambahkan ke dalam list atau struktur data lain. Ini adalah bagian dari pengelolaan state dalam aplikasi.

4.Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
![image](https://github.com/user-attachments/assets/697a776d-a52a-4fbc-a956-e6455598a912)


5.Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
Langkah 11: Kemungkinan besar ini merujuk pada penggunaan initState() atau dispose(), dua metode yang sangat penting dalam lifecycle widget di Flutter.
initState() dipanggil sekali ketika widget pertama kali dimasukkan ke dalam tree, digunakan untuk inisialisasi data atau pengaturan yang hanya perlu dilakukan sekali.
dispose() dipanggil ketika widget dihancurkan, untuk membebaskan resource seperti controller atau listener yang perlu dibersihkan setelah widget tidak lagi digunakan.
Langkah 13: Kemungkinan ini berhubungan dengan pembaruan atau interaksi lebih lanjut dengan state setelah perubahan terjadi, yang memungkinkan aplikasi untuk merespons secara dinamis terhadap input atau kondisi baru. Method ini memungkinkan aplikasi untuk memeriksa atau memperbarui tampilan berdasarkan state yang berubah.

Praktikum 2
hasilnya 
![WhatsApp Image 2024-11-11 at 10 06 16_a73cca29](https://github.com/user-attachments/assets/61cd22ed-2e4f-470e-971a-c88803efd502)
Tugas praktikum 2
2.Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?
InheritedWidget adalah sebuah widget yang memungkinkan data untuk dibagikan ke widget-widget yang berada di bawahnya dalam pohon widget (widget tree) di Flutter. InheritedWidget sering digunakan untuk mengelola dan menyediakan data atau status yang bersifat global untuk widget-widget lainnya tanpa harus menggunakan parameter atau argumen yang berulang di seluruh pohon widget. Biasanya, InheritedWidget digunakan untuk menyimpan data yang akan dibagikan ke banyak widget secara efisien.
InheritedNotifier adalah subclass dari InheritedWidget yang lebih canggih dan terintegrasi dengan ChangeNotifier. Ia memungkinkan pengelolaan status lebih dinamis dengan memberi kemampuan untuk memperbarui UI ketika data berubah. Perbedaan utamanya adalah, InheritedNotifier dapat memberi pemberitahuan (notify) kepada widget yang bergantung padanya ketika terjadi perubahan status, yang tidak bisa dilakukan hanya dengan InheritedWidget saja. Inilah alasan mengapa InheritedNotifier digunakan pada langkah tersebut, karena membutuhkan kemampuan untuk memperbarui tampilan secara dinamis ketika data berubah.

3.Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?
Biasanya dalam praktikum seperti ini, langkah 3 melibatkan pengaturan atau pemanggilan metode yang terkait dengan perubahan status atau tampilan UI. Method tersebut kemungkinan besar digunakan untuk memperbarui UI berdasarkan status atau data yang baru.
Mengapa dilakukan demikian yaitu Metode ini digunakan untuk mengelola data atau status dengan cara yang efisien, agar UI dapat selalu diperbarui secara otomatis setiap kali ada perubahan status tanpa perlu memanggil ulang seluruh widget atau melakukan render ulang yang berlebihan. Metode ini memastikan performa aplikasi tetap optimal dan UI tetap konsisten dengan status terkini.

4.Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
![WhatsApp Image 2024-11-11 at 10 06 16_a73cca29](https://github.com/user-attachments/assets/61cd22ed-2e4f-470e-971a-c88803efd502)

Praktikum 3
Hasilnya
![image](https://github.com/user-attachments/assets/e8b2b536-27be-423c-b443-2fef7e8b2304)

Tugas Praktikum 3
2.Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
Jika diagram yang dimaksud adalah diagram alur atau flowchart, biasanya diagram ini menggambarkan langkah-langkah atau urutan proses dalam suatu sistem, mulai dari input, proses, hingga output. Dalam konteks praktikum Flutter, ini mungkin menggambarkan bagaimana data atau status berpindah antar widget, bagaimana widget merespons interaksi pengguna, atau bagaimana state diubah dan diperbarui.

Jika diagram yang dimaksud adalah diagram kelas atau class diagram, diagram ini akan menggambarkan hubungan antar kelas dalam program, termasuk atribut, metode, serta inheritance yang mungkin ada antar kelas. Diagram kelas ini penting untuk memahami struktur objek di dalam aplikasi yang Anda buat.

Jika yang dimaksud adalah diagram widget tree dalam konteks Flutter, diagram ini akan menunjukkan bagaimana widget diatur dalam hierarki pohon (tree) dan bagaimana widget yang lebih tinggi mengelola atau mewariskan data ke widget di bawahnya, misalnya menggunakan InheritedWidget atau InheritedNotifier.

Tujuan diagram ini adalah untuk memberikan gambaran secara visual tentang bagaimana aplikasi atau sistem berfungsi, interaksi antar komponen, dan aliran data atau status.

3. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
   ![image](https://github.com/user-attachments/assets/dfe7d9f8-05de-45ab-b606-c02eaa5b2d43)
  
penjelasan:
Sistem UI dan Tema:
-Status bar transparan dengan ikon putih
-Warna deep purple yang tepat (0xFF673AB7)
-Background color light purple (0xFFF8F7FB)
-Disabled debug banner
AppBar:
-Ukuran font 20px untuk judul
-Avatar dengan background semi-transparan
-Icon person_outline dengan ukuran yang tepat
Input "Add a plan":
-Elevation dan border radius yang tepat
-Padding 16px di semua sisi
-Warna hint text yang sesuai (9E9E9E)
-Border yang bersih tanpa garis
List Plans:
-Padding horizontal 16px
-Spacing 8px antar item
-Text style yang tepat untuk judul (16px, 500 weight)
-Text style untuk subtitle (14px, grey)
-Inkwell effect untuk tap
Model Classes:
-Implementasi copyWith untuk immutability
-Getter untuk menghitung completed tasks
-Proper task completion tracking

