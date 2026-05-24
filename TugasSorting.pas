program PerbandinganMetodePengurutan;

uses sysutils, windows;

const
    N = 8; {jumlah elemen array}

type
    TArray = array[1..N] of integer;

var
    dataAwal : TArray = (8, 4, 1, 6, 20, 9, 14, 17); {array untuk menyimpan data awal}
    data : TArray;
    i : integer;
    waktu_awal, waktu_akhir, selisih: Int64;
    microdetik: double;


{procedure cetak array}
{menampilkan isi array ke layar}
procedure cetakArray(arr: TArray);
var
    j: integer;
begin
    for j := 1 to N do
    begin
        write(arr[j]);
        if j < N then write(' ');
    end;
    writeln;
end;


{procedure salin array}
{menyalin isi array dari sumber ke tujuan}
procedure salinArray(var sumber, tujuan: TArray);
var
    j: integer;
begin
    for j := 1 to N do
    begin
        tujuan[j] := sumber[j];
    end;
end; 


{procedure bubble sort}
{mengurutkan array menggunakan metode bubble sort}
procedure bubbleSort(var arr: TArray);
var
    j, k, temp: integer;
begin
    for j := 1 to N - 1 do
        for k := 1 to N - j do
            if arr[k] > arr[k + 1] then
            begin
                temp := arr[k];
                arr[k] := arr[k + 1];
                arr[k + 1] := temp;
            end;
end;


{procedure selection sort}
{mengurutkan array menggunakan metode selection sort}
procedure selectionSort(var arr: TArray);
var
    j, k, minIndex, temp: integer;
begin
    for j := 1 to N - 1 do
    begin
        minIndex := j;
        for k := j + 1 to N do
            if arr[k] < arr[minIndex] then
                minIndex := k;
        if minIndex <> j then
        begin
            temp := arr[j];
            arr[j] := arr[minIndex];
            arr[minIndex] := temp;
        end;
    end;
end;


{procedure insertion sort}
{mengurutkan array menggunakan metode insertion sort}
procedure insertionSort(var arr: TArray);
var
    j, k, key: integer;
begin
    for j := 2 to N do
    begin
        key := arr[j];
        k := j - 1;
        while (k >= 1) and (arr[k] > key) do
        begin
            arr[k + 1] := arr[k];
            k := k - 1;
        end;
        arr[k + 1] := key;
    end;
end;


{fungsi: HitungWaktu (microdetik)}
{mengembalikan selisih waktu dalam microdetik}
function MicroSecondsBetween(startTime, endTime: TDateTime): Int64;
begin
    MicroSecondsBetween := Round((endTime - startTime) * 24 * 60 * 60 * 1000000); {konversi ke microdetik}
end;

{PRORGAM UTAMA}
begin
    {inisialisasi data acak}
    randomize;
    WriteLn('Prebandingan Metode Pengurutan');
    WriteLn('--------------------------------');
    WriteLn('Data Awal:');
    for i := 1 to N do
    begin
        Write(dataAwal[i]);
        if i < N then Write(' ');
    end;
    WriteLn;
    Writeln;

    {uji bubble sort}
    SalinArray(dataAwal, data); {salin data awal ke array yang akan diurutkan}
    Writeln('Bubble Sort:');
    write('Data Sebelum : ');
    cetakArray(data);

    QueryPerformanceCounter(waktu_awal); {mulai pengukuran waktu}
    bubbleSort(data); {urutkan data menggunakan bubble sort}
    QueryPerformanceCounter(waktu_akhir); {selesai pengukuran waktu}
    selisih := waktu_akhir - waktu_awal; {hitung selisih waktu}
    microdetik := selisih;

    Write('Data terurut : ');
    cetakArray(data);
    WriteLn('Waktu Eksekusi: ', selisih, ' microdetik');
    Writeln('--------------------------------');
    writeln;

    {uji selection sort}
    SalinArray(dataAwal, data); {salin data awal ke array yang akan diurutkan}
    Writeln('Selection Sort:');
    write('Data Sebelum : ');
    cetakArray(data);

    QueryPerformanceCounter(waktu_awal); {mulai pengukuran waktu}
    selectionSort(data); {urutkan data menggunakan selection sort}
    QueryPerformanceCounter(waktu_akhir); {selesai pengukuran waktu}
    selisih := waktu_akhir - waktu_awal; {hitung selisih waktu}
    microdetik := selisih;

    Write('Data terurut : ');
    cetakArray(data);
    WriteLn('Waktu Eksekusi: ', selisih, ' microdetik');
    Writeln('--------------------------------'); 
    writeln;

    {uji insertion sort}
    SalinArray(dataAwal, data); {salin data awal ke array yang akan diurutkan}
    Writeln('Insertion Sort:');
    write('Data Sebelum : ');
    cetakArray(data);

    QueryPerformanceCounter(waktu_awal); {mulai pengukuran waktu}
    insertionSort(data); {urutkan data menggunakan insertion sort}
    QueryPerformanceCounter(waktu_akhir); {selesai pengukuran waktu}
    selisih := waktu_akhir - waktu_awal; {hitung selisih waktu}
    microdetik := selisih;

    Write('Data terurut : ');
    cetakArray(data);
    WriteLn('Waktu Eksekusi: ', selisih, ' microdetik');
    Writeln('--------------------------------');

    Write('Tekan ENTER untuk keluar...');
    ReadLn;
end.