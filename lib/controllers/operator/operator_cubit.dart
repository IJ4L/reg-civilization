// ignore_for_file: use_build_context_synchronously
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pendataan/models/warga_model.dart';
import 'package:pendataan/models/wilayah_model.dart';
import 'package:pendataan/repository/api_service.dart';

part 'operator_state.dart';

class OperatorCubit extends Cubit<OperatorState> {
  OperatorCubit(this.apiService) : super(OperatorInitial());

  final ApiService apiService;

  Future<void> addDataWarga(
    String nik,
    String nama,
    String umur,
    String jenisKelamin,
    String jalan,
    String kelurahan,
    String kecamatan,
    String kabupaten,
    String provinsi,
    String akses,
    String milik,
  ) async {
    emit(OperatorLoading());
    try {
      if (nik.isNotEmpty &&
          nama.isNotEmpty &&
          umur.isNotEmpty &&
          jenisKelamin != '' &&
          jalan.isNotEmpty &&
          kelurahan != '') {
        await FirebaseFirestore.instance.collection('datawarga').add({
          'nik': nik,
          'nama': nama,
          'umur': umur,
          'jenisKelamin': jenisKelamin,
          'jalan': jalan,
          'kelurahan': kelurahan,
          'kecamatan': kecamatan,
          'kabupaten': kabupaten,
          'provinsi': provinsi,
          'akses': akses,
          'milik': milik,
          'createdAt': DateTime.now().toIso8601String(),
        });
        emit(OperatorSuccses());
      } else {
        emit(OperatorFailure('Isi data lengkap'));
      }
    } catch (e) {
      emit(OperatorFailure(e.toString()));
    }
  }

  Future<void> getAllDatawarga(String milik) async {
    emit(OperatorLoading());
    try {
      var data = await FirebaseFirestore.instance
          .collection('datawarga')
          .orderBy('createdAt', descending: true)
          .where('milik', isEqualTo: milik)
          .get();

      List<wargamodel> dataWrga =
          data.docs.map((e) => wargamodel.fromJson(e.data())).toList();

      emit(OperatorLoaded(dataWrga));
    } catch (e) {
      emit(OperatorFailure(e.toString()));
    }
  }

  Future<void> getAllKelurahan(String id) async {
    try {
      List<Kelurahan> data = await apiService.getKelurahan(id);

      emit(OperatorKelurahan(data));
    } catch (e) {
      emit(OperatorFailure(e.toString()));
    }
  }
}
