import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'dart:io' show Platform;
import 'package:lms/core/api/api_keys.dart';
import 'package:lms/core/utils/di.dart';
import 'package:lms/core/utils/storage_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 15);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.baseUrl = ApiKeys.baseUrl;

      debugPrint('Dio baseUrl: ${dio!.options.baseUrl}');

      dio?.options.headers = {
        'Accept': 'application/json',
      };

      addDioInterceptor();
      dio?.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            try {
              final token = await getIt<StorageHelper>().getUserToken();
              if (token != null && token.isNotEmpty) {
                options.headers['Authorization'] = 'Bearer $token';
              } else {
                options.headers.remove('Authorization');
              }
            } catch (_) {
            }
            return handler.next(options);
          },
          onError: (e, handler) {
            return handler.next(e);
          },
        ),
      );
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
    };
  }

  static void removeDioHeaders() {
    dio?.options.headers = {
      'Accept': 'application/json',
    };
    debugPrint("Token has been removed from header");
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    debugPrint("Token has been set into header");
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
