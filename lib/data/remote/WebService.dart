import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_design_patttern/model/PhotoModel.dart';

import '../../utils/Constants.dart';

class Webservice {
  Future<List<PhotoModel>> getPhotos() async {
    final response = await http.get(Uri.parse(Constants.baseUrl));
    if (response.statusCode == 200) {
      return (json.decode(response.body.toString()) as List)
          .map((i) => PhotoModel.fromJson(i))
          .toList();
    } else {
      throw Exception("Unable to perform request!");
    }

    // Use the compute function to run parsePhotos in a separate isolate.
    //return compute(parsePhotos, response.body);
  }
}
