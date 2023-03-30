import 'dart:convert';

List<Provinsi> privinsiFromJson(String str) =>
    List<Provinsi>.from(json.decode(str).map((x) => Provinsi.fromJson(x)));

String privinsiToJson(List<Provinsi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Provinsi {
  Provinsi({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

List<Kecamatan> kecamatanFromJson(String str) =>
    List<Kecamatan>.from(json.decode(str).map((x) => Kecamatan.fromJson(x)));

String kecamatanToJson(List<Kecamatan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kecamatan {
  Kecamatan({
    required this.id,
    required this.regencyId,
    required this.name,
  });

  final String id;
  final String regencyId;
  final String name;

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        id: json["id"],
        regencyId: json["regency_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regency_id": regencyId,
        "name": name,
      };
}

List<Kabupaten> kabupatenFromJson(String str) =>
    List<Kabupaten>.from(json.decode(str).map((x) => Kabupaten.fromJson(x)));

String kabupatenToJson(List<Kabupaten> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kabupaten {
  Kabupaten({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  final String id;
  final String provinceId;
  final String name;

  factory Kabupaten.fromJson(Map<String, dynamic> json) => Kabupaten(
        id: json["id"],
        provinceId: json["province_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name": name,
      };
}

List<Kelurahan> kelurahanFromJson(String str) =>
    List<Kelurahan>.from(json.decode(str).map((x) => Kelurahan.fromJson(x)));

String kelurahanToJson(List<Kelurahan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kelurahan {
  Kelurahan({
    required this.id,
    required this.districtId,
    required this.name,
  });

  final String id;
  final String districtId;
  final String name;

  factory Kelurahan.fromJson(Map<String, dynamic> json) => Kelurahan(
        id: json["id"],
        districtId: json["district_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_id": districtId,
        "name": name,
      };
}
