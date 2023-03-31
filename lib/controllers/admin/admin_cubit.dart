// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pendataan/models/admin_model.dart';
import 'package:pendataan/models/wilayah_model.dart';
import 'package:pendataan/repository/api_service.dart';
import 'package:pendataan/repository/firebase.dart';
import 'package:pendataan/view/screens/admin/admin_screen.dart';

import '../../models/warga_model.dart';
import '../../view/screens/login_screen.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this.apiService) : super(AdminInitial());

  final ApiService apiService;

  Future<void> getAllProvinsi() async {
    emit(AdminLoading());

    try {
      final provinsi = await apiService.getAllProvinsi();

      emit(AdminProvinsiLoaded(provinsi));
    } catch (e) {
      emit(AdminFailure(e.toString()));
    }
  }

  Future<void> getAllKabupaten(String id) async {
    emit(AdminLoading());

    try {
      final kabupaten = await apiService.getAllKabupaten(id);

      emit(AdminKabupatenLoaded(kabupaten));
    } catch (e) {
      emit(AdminFailure(e.toString()));
    }
  }

  Future<void> getAllKecamatam(String id) async {
    emit(AdminLoading());

    try {
      final kecamatan = await apiService.getAllKecamatan(id);

      emit(AdminKecamatanLoaded(kecamatan));
    } catch (e) {
      emit(AdminFailure(e.toString()));
    }
  }

  Future<void> getAllKelurahan(String id) async {
    try {
      List<Kelurahan> data = await apiService.getKelurahan(id);

      emit(AdminKelurahanLoaded(data));
    } catch (e) {
      emit(AdminFailure(e.toString()));
    }
  }

  Future<void> createOperator(
      String email,
      String password,
      String provinsi,
      String kabupaten,
      String kecamatan,
      String myAccount,
      String id,
      BuildContext context) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          provinsi != '' &&
          kabupaten != '' &&
          kecamatan != '') {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        FirebaseFirestore.instance.collection('users').doc(email).set(
          {
            'email': email,
            'password': password,
            'provinsi': provinsi,
            'kabupaten': kabupaten,
            'kecamatan': kecamatan,
            'id_kecamatan': id,
            'role': 'Operator',
            'status': true,
            'createdBy': myAccount,
          },
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Adminpage()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Isi Data Lengkap'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'The-email-address-is-badly-formatted') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> updateTarge(String email, String targetUpdate) async {
    FirebaseFirestore.instance.collection('users').doc(email).update({
      'target': targetUpdate,
    });
  }

  Future<void> getAllOperator(String email) async {
    emit(AdminLoading());
    try {
      List<AdminModel> operator = await getAllOperators(email);

      var data = await FirebaseFirestore.instance
          .collection('datawarga')
          .orderBy('createdAt', descending: true)
          .where('akses', isEqualTo: email)
          .get();

      List<wargamodel> dataWrga =
          data.docs.map((e) => wargamodel.fromJson(e.data())).toList();

      emit(AdminGetAll(operator, dataWrga));
    } catch (error) {
      emit(AdminFailure(error.toString()));
    }
  }

  Future<void> filterwilayah(
    String wilayah,
    String email,
    String jenisKelamin,
  ) async {
    List<AdminModel> operator = await getAllOperators(email);

    var data = await FirebaseFirestore.instance
        .collection('datawarga')
        .orderBy('createdAt', descending: true)
        .where('akses', isEqualTo: email)
        .get();

    List<wargamodel> dataWrga =
        data.docs.map((e) => wargamodel.fromJson(e.data())).toList();

    if (wilayah != '') {
      List<wargamodel> filter =
          dataWrga.where((element) => element.kelurahan == wilayah).toList();

      emit(AdminGetAll(operator, filter));
    }

    if (jenisKelamin != '') {
      List<wargamodel> filter = dataWrga
          .where((element) => element.jenisKelamin == jenisKelamin)
          .toList();

      emit(AdminGetAll(operator, filter));
    }
  }

  Future<void> filterUsia(String email, int start, int end) async {
    List<AdminModel> operator = await getAllOperators(email);

    var data = await FirebaseFirestore.instance
        .collection('datawarga')
        .orderBy('createdAt', descending: true)
        .where('akses', isEqualTo: email)
        .get();

    List<wargamodel> dataWrga =
        data.docs.map((e) => wargamodel.fromJson(e.data())).toList();

    List<wargamodel> filter = dataWrga
        .where(
          (element) =>
              int.parse(element.umur.toString()) >= start &&
              int.parse(element.umur.toString()) <= end,
        )
        .toList();

    emit(AdminGetAll(operator, filter));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }
}
