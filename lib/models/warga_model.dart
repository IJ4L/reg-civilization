// ignore_for_file: non_constant_identifier_names, camel_case_types

class wargamodel {
  String? akses;
  String? jalan;
  String? jenisKelamin;
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  String? nama;
  String? nik;
  String? provinsi;
  String? umur;
  String? milik;

  wargamodel({
    this.akses,
    this.jalan,
    this.jenisKelamin,
    this.kabupaten,
    this.kecamatan,
    this.kelurahan,
    this.nama,
    this.provinsi,
    this.nik,
    this.umur,
    this.milik,
  });

  wargamodel.fromJson(Map<String, dynamic> json) {
    akses = json['akses'];
    jalan = json['jalan'];
    jenisKelamin = json['jenisKelamin'];
    kabupaten = json['kabupaten'];
    kecamatan = json['kecamatan'];
    kelurahan = json['kelurahan'];
    nama = json['nama'];
    provinsi = json['provinsi'];
    nik = json['nik'];
    umur = json['umur'];
    milik = json['milik'];
  }
}
