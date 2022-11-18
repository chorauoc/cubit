import 'package:dio/dio.dart';

import '../utility/constants.dart';

class Api {
  Dio _dio() {
    Dio dioClient = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: 5000,
        receiveTimeout: 100000,
        headers: {
          'Authorization': TOKEN,
        },
      ),
    );
    dioClient.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) {
      print(
          'REQUEST#### [${options.method}] => URL: ${options.uri} => DATA: ${options.data}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('RESPONSE#### [${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (DioError err, handler) {
      print('ERROR#### [${err.response?.statusCode}] => MSG: ${err.message}');
      return handler.next(err);
    }));
    return dioClient;
  }

  Future<void> requestGet({
    required String url,
    required dynamic data,
    required Function() onInit,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    onInit.call();
    await Future.delayed(const Duration(milliseconds: 300));
    await _dio().get(url, queryParameters: data).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  Future<void> requestPost({
    required String url,
    required dynamic data,
    required Function() onInit,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    onInit.call();
    await Future.delayed(const Duration(milliseconds: 300));
    await _dio().post(
      url,
      data: data,
      onSendProgress: (int sent, int total) {
        print('PROGRESS#### SENT [${sent}] => TOTAL: ${total}');
      },
    ).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }
}
