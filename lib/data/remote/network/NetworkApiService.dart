import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_design_patttern/utils/Constants.dart';

import '../AppException.dart';
import 'BaseApiService.dart';

class NetworkApiService extends BaseApiService {
  static const id = 'NetworkApiService';
  dynamic responseJson;
  @override
  Future getResponse(String url) async {
    try {
      final response = await http.get(Uri.parse(Constants.baseUrl + url));
      responseJson = returnResponse(response);
      print('NetworkApiService - reem');
    } on SocketException {
      print('${id}No Internet Connection');
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, Map<String, String> JsonBody) async {
    dynamic responseJson;
    try {
      final response =
          await http.post(Uri.parse(Constants.baseUrl + url), body: JsonBody);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    print('status code ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        responseJson = jsonDecode(response.body);
        print('responseJson  $responseJson');
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
