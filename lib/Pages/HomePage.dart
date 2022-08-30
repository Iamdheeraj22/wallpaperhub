import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperhub/Model/CategoriesModel.dart';
import 'package:wallpaperhub/Model/Lists.dart';
import 'package:wallpaperhub/Model/PhotosModel.dart';
import 'package:wallpaperhub/Widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<PhotosModel>? _getPhotos;

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> _categoriesList = [];
  @override
  void initState() {
    super.initState();
    _categoriesList = getCategoriesList();
    Future.delayed(Duration.zero, () {
      _getPhotos = getAllPhotos(context);
      setState(() {});
      _getPhotos!.whenComplete(() => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: appName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      onChanged: (v) {},
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Search"),
                    )),
                    const Icon(Icons.search)
                  ],
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
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/tech.jpeg",
                                fit: BoxFit.cover,
                                width: 100,
                                height: 50,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(92, 121, 121, 121),
                                  borderRadius: BorderRadius.circular(8)),
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 8, left: 8),
                              height: 50,
                              width: 100,
                              child: Text(
                                _categoriesList[index].title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              customBox(height: 15),
              get_all_photos()
            ],
          ),
        ),
      ),
    );
  }

  get_all_photos() {
    return Container(
      height: getHeight(context) / 2,
      margin: EdgeInsets.all(15),
      child: FutureBuilder<PhotosModel>(
          future: _getPhotos,
          builder: (context, snpshot) {
            return snpshot.hasData && snpshot.data!.photos!.isNotEmpty
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    itemCount: snpshot.data!.photos!.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        snpshot.data!.photos![index].src!.portrait.toString(),
                        fit: BoxFit.cover,
                      );
                    })
                : Center(
                    child: Text("No photos"),
                  );
          }),
    );
  }
}
