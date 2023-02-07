import 'package:mvvm_design_patttern/model/PhotoModel.dart';

import '../../data/remote/network/ApiEndPoints.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';

class PhotoRepo {
  BaseApiService _apiService = NetworkApiService();
  Future<PhotoModel> getPhotoList() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getPhotos);
      print("photo Rep $response");
      final jsonData = PhotoModel.fromJson(response);
      // return (json.decode(response.body.toString()) as List)
      //     .map((i) => PhotoModel.fromJson(i))
      //     .toList();
      print('jsonData $jsonData');
      return jsonData;
    } catch (e) {
      print('exeption' + e.toString());
      throw e;
    }
  }
}
