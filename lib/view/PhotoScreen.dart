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
        title: Text('Notes'),
      ),
      body: ChangeNotifierProvider<PhotoListVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<PhotoListVM>(builder: (context, viewModel, _) {
          print(viewModel.photoMain.data?.code);
          switch (viewModel.photoMain.status) {
            case Status.LOADING:
              print("MARAJ :: LOADING");
              return LoadingWidget();
            case Status.ERROR:
              print("MARAJ :: ERROR ");
              return MyErrorWidget(viewModel.photoMain.message ?? "NA");
            case Status.COMPLETED:
              print("MARAJ :: COMPLETED");
              return _getPhotosListView(viewModel.photoMain.data!.data!);
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
    // leading: CircleAvatar(
    //   backgroundImage: NetworkImage(item.url.toString()),
    // ),
    subtitle: Text(item.identifier.toString()),
    title: Text('Notes id:${item.englishName}'),
  );
}

//
// body: FutureBuilder<List<PhotoModel>>(
// future: vm.fetchPhotos(),
// builder: (context, snapshot) {
// if (snapshot.hasError) {
// return const Center(
// child: Text('An error has occurred!'),
// );
// } else if (snapshot.hasData) {
// return PhotosList(photos: snapshot.data!);
// } else {
// return const Center(
// child: CircularProgressIndicator(),
// );
// }
// },
// )
class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            // leading: CircleAvatar(
            //   backgroundImage: NetworkImage(photos[index].url.toString()),
            // ),
            subtitle: Text(photos[index].identifier.toString()),
            title: Text('Notes id:${photos[index].englishName}'),
          );
        });
  }
}
