import 'dart:convert';

List<Surah> surahFromJson(String str) =>
    List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

class Surah {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyah;
  String tempatTurun;
  String arti;
  String deskripsi;
  String audio;

  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyah,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  // GET data from JSON to class surah
  // ketika manggil class surah
  // output :
  // surah 1 = Alfatihah, arab alfatihah, jumlah ayat
  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
      nomor: json['nomor'],
      nama: json['nama'],
      namaLatin: json['nama_latin'],
      jumlahAyah: json['jumlah_ayah'],
      tempatTurun: json['tempat_turun'],
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audio: json['audio']);

  //
  Map<String, dynamic> toJson() => {
        'nomor': nomor,
        'nama': nama,
        'nama_latin': namaLatin,
        'jumlah_ayah': jumlahAyah,
        'tempat_turun': tempatTurun,
        'arti': arti,
        'deskripsi': deskripsi,
        'audio': audio
      };
}

enum tempatTurun { MADINAH, MAKKAH }

final tempatTurunValue =
    EnumValues({'madinah': tempatTurun.MADINAH, 'makkah': tempatTurun.MAKKAH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((key, value) => MapEntry(value, key));
    return reverseMap;
  }
}
