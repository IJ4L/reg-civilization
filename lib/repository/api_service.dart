import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pendataan/models/wilayah_model.dart';

class ApiService {
  final http.Client client;
  ApiService({
    required this.client,
  });

  Future<List<Provinsi>> getAllProvinsi() async {
    try {
      final response = await client.get(
        Uri.parse(
            'https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json'),
      );
      return List<Provinsi>.from(
        jsonDecode(response.body).map(
          (x) => Provinsi.fromJson(x),
        ),
      ).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Kabupaten>> getAllKabupaten(String id) async {
    try {
      final response = await client.get(
        Uri.parse(
            'https://emsifa.github.io/api-wilayah-indonesia/api/regencies/$id.json'),
      );
      return List<Kabupaten>.from(
        jsonDecode(response.body).map(
          (x) => Kabupaten.fromJson(x),
        ),
      ).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Kecamatan>> getAllKecamatan(String id) async {
    try {
      final response = await client.get(
        Uri.parse(
            'https://emsifa.github.io/api-wilayah-indonesia/api/districts/$id.json'),
      );
      return List<Kecamatan>.from(
        jsonDecode(response.body).map(
          (x) => Kecamatan.fromJson(x),
        ),
      ).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Kelurahan>> getKelurahan(String id) async {
    try {
      final response = await client.get(
        Uri.parse(
            'https://emsifa.github.io/api-wilayah-indonesia/api/villages/$id.json'),
      );
      return List<Kelurahan>.from(
        jsonDecode(response.body).map(
          (x) => Kelurahan.fromJson(x),
        ),
      ).toList();
    } catch (e) {
      return [];
    }
  }
}
