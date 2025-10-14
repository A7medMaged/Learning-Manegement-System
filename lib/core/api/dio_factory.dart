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

      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    final token = await getIt<StorageHelper>().getUserToken();
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
      'Cache-Control': 'no-cache',
      // Do NOT set a global Content-Type header for multipart requests.
      // Dio will set the correct Content-Type with boundary when using FormData.
      'Accept': '*/*',
      'Connection': 'keep-alive',
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
