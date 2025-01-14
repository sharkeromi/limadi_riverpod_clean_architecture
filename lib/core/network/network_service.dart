import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/common_model/common_data_model.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/common_model/environment.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/const.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/functions.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class ApiController {
  CommonDM convertToCommonObject(apiResponse) {
    return CommonDM.fromJson(apiResponse);
  }

  void timeOutFunction() {
    String error = ksConnectionTimeoutMessage;
    showToaster(error);
  }

  Future<http.Response> methodBasedResponse({
    required String method,
    required String? token,
    Map<String, dynamic>? body,
    required Uri uri,
    int? timer,
    required http.Client client,
  }) async {
    Map<String, String>? headers = {
      if (token != null) 'Authorization': 'Bearer $token',
      if (method == kGet) "Content-Type": "application/json",
      "accept": "application/json",
    };
    if (method == "GET") {
      return await client.get(uri, headers: headers).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          timeOutFunction();
          throw TimeoutException(ksConnectionTimeoutMessage);
        },
      );
    } else if (method == "POST") {
      return await client.post(uri, body: body, headers: headers).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          timeOutFunction();
          throw TimeoutException(ksConnectionTimeoutMessage);
        },
      );
    } else if (method == "PUT") {
      return await client.put(uri, body: body, headers: headers).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          timeOutFunction();
          throw TimeoutException(ksConnectionTimeoutMessage);
        },
      );
    } else {
      return await client.delete(uri, body: body, headers: headers).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          timeOutFunction();
          throw TimeoutException(ksConnectionTimeoutMessage);
        },
      );
    }
  }

  //* Common Api call
  Future<dynamic> commonApiCall({
    String? token,
    required String url,
    Map<String, dynamic>? body,
    required String requestMethod,
    int? timer,
    logNeeded = false,
  }) async {
    final http.Client client = http.Client();
    final Uri uri = Uri.parse(Environment.apiUrl + url);
    if (logNeeded) {
      log("uri : $uri");
      log('body: $body');
    }
    http.Response response;
    String error = ksSomethingWentWrong;

    try {
      response = await methodBasedResponse(
        method: requestMethod,
        token: token,
        body: body,
        uri: uri,
        timer: timer,
        client: client,
      );
      if (logNeeded) {
        log("response statusCode : ${response.statusCode}");
      }
      if (response.statusCode < 500) {
        if (response.statusCode == 401 || response.statusCode == 403) {
          //todo: clear user info and credentials
          log(ksUnAuthorizedError);
          return null;
        }
        final object = json.decode(response.body.toString());
        final prettyString = const JsonEncoder.withIndent('  ').convert(object);
        if (logNeeded) {
          log("Response : $prettyString");
        }
        CommonDM cm = convertToCommonObject(jsonDecode(response.body));
        return cm;
      } else {
        log(error.toString());
        return null;
      }
    } on SocketException {
      error =ksNoInternetConnectionMessage;
      log(error.toString());
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    } finally {
      client.close();
    }
  }

  // dio post type of request
  Future<dynamic> commonPostDio({
    required String url,
    required String? token,
    required body,
    int? timer,
    logNeeded = false,
  }) async {
    if (logNeeded) {
      log("Url : $url");
    }
    Dio dio = Dio();
    Map<String, String>? headers = {
      if (token != null) 'Authorization': 'Bearer $token',
      "Content-Type": "application/json",
      "accept": "application/json",
    };

    String error = ksSomethingWentWrong;
    var response;
    try {
      response = await dio
          .post(
        Environment.apiUrl + url,
        data: body,
        options: Options(
          validateStatus: (status) {
            return status! < 501;
          },
          headers: headers,
        ),
      )
          .timeout(Duration(seconds: timer ?? 60), onTimeout: () {
        error = ksConnectionTimeoutMessage;
        log(error.toString());
        throw TimeoutException(ksConnectionTimeoutMessage);
      });
      log("response statusCode : ${response.statusCode}");
      if (response.statusCode < 500) {
        if (response.statusCode == 401 || response.statusCode == 403) {
          //todo: clear user credentials
          log(ksUnAuthorizedError);
          return null;
        }
        if (logNeeded) {
          final object = json.decode(response.toString());
          final prettyString = const JsonEncoder.withIndent('  ').convert(object);
          log("Response : $prettyString");
        }
        CommonDM cm = convertToCommonObject(response.data);
        return cm;
      } else {
        log(error.toString());
        return null;
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        error = ksNoInternetConnectionMessage;
        log(error.toString());

        return null;
      } else {
        log(e.toString());
        log("response status error : $response");

        return null;
      }
    } finally {
      dio.close();
    }
  }
}
