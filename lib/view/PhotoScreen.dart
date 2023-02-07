import 'package:flutter/material.dart';
import 'package:mvvm_design_patttern/model/PhotoModel.dart';
import 'package:mvvm_design_patttern/view/widget/LoadingWidget.dart';
import 'package:mvvm_design_patttern/view/widget/MyErrorWidget.dart';
import 'package:provider/provider.dart';

import '../data/remote/response/ApiResponse.dart';
import '../view_model/PhotosVM.dart';

class PhotoScreen extends StatefulWidget {
  static const id = 'PhotoScreen';
  const PhotoScreen({Key? key}) : super(key: key);
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final PhotoListVM viewModel = PhotoListVM();
  //
  @override
  void initState() {
    //passing listen: false for the Provider,
    //which means this is a one-time call only, and the changes won’t be tracked by the Provider.
    viewModel.fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //By adding the Provider inside the build method,
    // we ensure whenever notifyListener is fired, we have access to the instance of PhotoListViewModel.
    //  final vm = Provider.of<PhotoListVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ChangeNotifierProvider<PhotoListVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<PhotoListVM>(builder: (context, viewModel, _) {
          //   print(viewModel.photoMain.data?);
          switch (viewModel.photoMain.status) {
            case Status.LOADING:
              print("Status :: LOADING");
              return LoadingWidget();
            case Status.ERROR:
              print("Status :: ERROR ");
              return MyErrorWidget(viewModel.photoMain.message ?? "NA");
            case Status.COMPLETED:
              print("Status :: COMPLETED");
              return _getPhotosListView(viewModel.photoMain.data!.data!!);
            default:
          }
          return Container();
        }),
      ),
    );
  }
}

Widget _getPhotosListView(List<Photo> photoList) {
  return ListView.builder(
      itemCount: photoList.length,
      itemBuilder: (context, position) {
        return _getPhotoListItem(photoList[position]);
      });
}

Widget _getPhotoListItem(Photo item) {
  //card
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(item.url.toString()),
    ),
    subtitle: Text(item.title.toString()),
    title: Text('Notes id:${item.id}'),
  );
}
