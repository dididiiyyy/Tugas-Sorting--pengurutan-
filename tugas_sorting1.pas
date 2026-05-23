program TugasSorting;

var
  nama: string;
  nilaiTugas, nilaiUTS, nilaiUAS: real;
  rataRata: real;

begin
  
  writeln('=== PROGRAM HASIL PENILAIAN MAHASISWA ===');
  write('Masukkan Nama Mahasiswa: '); 
  readln(nama);
  
  write('Masukkan Nilai Tugas: '); 
  readln(nilaiTugas);
  
  write('Masukkan Nilai UTS  : '); 
  readln(nilaiUTS);
  
  write('Masukkan Nilai UAS  : '); 
  readln(nilaiUAS);

  { Menghitung rata-rata }
  rataRata := (nilaiTugas + nilaiUTS + nilaiUAS) / 3;

  writeln;
  writeln('-----------------------------------');
  writeln('Nama Mahasiswa : ', nama);
  writeln('Nilai Rata-rata: ', rataRata:0:2); { :0:2 agar hanya 2 angka di belakang koma }

  { Logika Percabangan (IF THEN ELSE) }
  if (rataRata >= 70) then
    begin
      writeln('Status         : LULUS');
      writeln('Selamat, pertahankan prestasimu!');
    end
  else
    begin
      writeln('Status         : TIDAK LULUS');
      writeln('Tetap semangat, silakan coba lagi di semester depan.');
    end;

  writeln('-----------------------------------');
  write('Tekan ENTER untuk keluar...');
  readln;
end.