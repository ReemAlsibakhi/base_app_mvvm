import 'package:flutter/cupertino.dart';
import 'package:mvvm_design_patttern/model/PhotoModel.dart';
import 'package:mvvm_design_patttern/repository/photos/PhotoRepo.dart';

import '../data/remote/response/ApiResponse.dart';

/*
view models that’ll be responsible for providing the data to the view.
will represent the entire screen of displaying the photos

ChangeNotifier:
 allows us to publish change notifications, which can be used by the view to update itself.
*/

class PhotoListVM extends ChangeNotifier {
  final _myRepo = PhotoRepo();
  ApiResponse<PhotoModel> photoMain = ApiResponse.loading();

  void _setPhotoMain(ApiResponse<PhotoModel> response) {
    print("reem response :: $response");
    photoMain = response;
    notifyListeners();
  }

  Future<void> fetchPhotos() async {
    _setPhotoMain(ApiResponse.loading());
    _myRepo
        .getPhotoList()
        .then((value) => _setPhotoMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setPhotoMain(ApiResponse.error(error.toString())));
  }
}
