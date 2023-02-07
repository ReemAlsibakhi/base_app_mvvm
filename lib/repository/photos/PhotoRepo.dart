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
      print("photo Rep -reem $jsonData");

      return jsonData;
    } catch (e) {
      print('exeption error ' + e.toString());
      throw e;
    }
  }
}
