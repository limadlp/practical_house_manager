import 'package:dio/dio.dart';

class HttpClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8080',
    ),
  );

  Future<Response> _request(
    Future<Response> Function() requestFn,
  ) async {
    try {
      return await requestFn();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        throw Exception(
            "Erro de conexão: Não foi possível conectar ao servidor.");
      }
      throw Exception("Erro na requisição: ${e.message}");
    } catch (e) {
      throw Exception("Erro inesperado: $e");
    }
  }

  Future<Response> get(String path) async {
    return _request(() => _dio.get(path));
  }

  Future<Response> post(String path, {dynamic data}) async {
    return _request(() => _dio.post(path, data: data));
  }

  Future<Response> put(String path, {dynamic data}) async {
    return _request(() => _dio.put(path, data: data));
  }

  Future<Response> delete(String path) async {
    return _request(() => _dio.delete(path));
  }
}
