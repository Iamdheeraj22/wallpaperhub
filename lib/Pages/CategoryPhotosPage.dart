import 'package:flutter/material.dart';
import 'package:wallpaperhub/Model/PhotosModel.dart';
import 'package:wallpaperhub/Widgets.dart';

class CategoryPhotosPage extends StatefulWidget {
  String categoryTitle = "";
  String imgURl = "";
  CategoryPhotosPage(
      {Key? key, required this.categoryTitle, required this.imgURl})
      : super(key: key);

  @override
  State<CategoryPhotosPage> createState() => _CategoryPhotosPageState();
}

class _CategoryPhotosPageState extends State<CategoryPhotosPage> {
  Future<PhotosModel>? _getPhotos;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getPhotos = getAllSearchPhotos(context,
          search: widget.categoryTitle.toString(), isShow: false);
      setState(() {});
      _getPhotos!.whenComplete(() => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          widget.categoryTitle.toString(),
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(15),
          child: FutureBuilder<PhotosModel>(
              future: _getPhotos,
              builder: (context, snpshot) {
                return snpshot.hasData && snpshot.data!.photos!.isNotEmpty
                    ? GridView.builder(
                        physics: ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        itemCount: snpshot.data!.photos!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                snpshot.data!.photos![index].src!.medium
                                    .toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        })
                    : Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      );
              }),
        )),
      ),
    );
  }
}
