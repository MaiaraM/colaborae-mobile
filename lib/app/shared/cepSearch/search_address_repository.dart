import 'package:colaborae/app/modules/login/models/login.dart';
import 'package:colaborae/app/shared/cepSearch/CepModel.dart';
import 'package:colaborae/app/shared/repositories/BaseRepository.dart';
import 'package:dio/dio.dart';

class SearchAddressRepository {
  final Dio dio;

  SearchAddressRepository(this.dio);

  @override
  Future<CepModel> getInfoByCep(String cep) async {
    try {
      var response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        return CepModel.fromMap(response.data);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
