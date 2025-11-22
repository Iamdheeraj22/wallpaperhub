import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaperhub/Model/CategoriesModel.dart';
import 'package:wallpaperhub/Model/Lists.dart';
import 'package:wallpaperhub/Model/PhotosModel.dart';
import 'package:wallpaperhub/Pages/CategoryPhotosPage.dart';
import 'package:wallpaperhub/Pages/FullImagePage.dart';
import 'package:wallpaperhub/Pages/SearchingPage.dart';
import 'package:wallpaperhub/Widgets.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home-page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<PhotosModel>? _getPhotos;

//

class _HomePageState extends State<HomePage> {
  bool storageGranted = false;
  List<CategoriesModel> _categoriesList = [];

  @override
  void initState() {
    super.initState();
    checkpermission_opencamera();
    _categoriesList = getCategoriesList();
    Future.delayed(Duration.zero, () {
      _getPhotos = getAllPhotos(context, isShow: false);
      setState(() {});
      _getPhotos!.whenComplete(() => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: appName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => SearchingPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [Text("Search"), Spacer(), Icon(Icons.search)],
              ),
            ),
          ),
          customBox(height: 15),
          Container(
            margin: const EdgeInsets.only(left: 24),
            height: 50,
            child: ListView.builder(
              itemCount: _categoriesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => CategoryPhotosPage(
                          categoryTitle: _categoriesList[index].title,
                          imgURl: _categoriesList[index].imageUrl,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: _categoriesList[index].imageUrl,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 50,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(92, 121, 121, 121),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 8, left: 8),
                          height: 50,
                          width: 100,
                          child: Text(
                            _categoriesList[index].title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          customBox(height: 15),
          FutureBuilder<PhotosModel>(
            future: _getPhotos,
            builder: (context, snpshot) {
              return snpshot.hasData && snpshot.data!.photos!.isNotEmpty
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        itemCount: snpshot.data!.photos!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullImagePage(
                                    model: snpshot.data!.photos![index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: snpshot
                                      .data!
                                      .photos![index]
                                      .src!
                                      .medium
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  checkpermission_opencamera() async {
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) await Permission.storage.request();
    if (await Permission.storage.isGranted) {
      storageGranted = true;
    } else {
      storageGranted = false;
    }
  }
}
