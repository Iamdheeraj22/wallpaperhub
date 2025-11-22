import 'package:flutter/material.dart';
import 'package:wallpaperhub/Model/PhotosModel.dart';
import 'package:wallpaperhub/Pages/FullImagePage.dart';
import 'package:wallpaperhub/Widgets.dart';

class SearchingPage extends StatefulWidget {
  SearchingPage({Key? key}) : super(key: key);

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  Future<PhotosModel>? _getPhotos;

  var searchImage = "God";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getPhotos = getAllSearchPhotos(
        context,
        search: searchImage,
        isShow: false,
      );
      setState(() {});
      _getPhotos!.whenComplete(() => null);
    });
  }

  updateImagesList() {
    Future.delayed(Duration.zero, () {
      _getPhotos = getAllSearchPhotos(
        context,
        search: searchImage,
        isShow: false,
      );
      setState(() {});
      _getPhotos!.whenComplete(() => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              customBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 227, 241),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (v) {
                          setState(() {
                            setState(() {
                              searchImage = v.toString();
                              updateImagesList();
                            });
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                        ),
                      ),
                    ),
                    const Icon(Icons.search),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<PhotosModel>(
                  future: _getPhotos,
                  builder: (context, snpshot) {
                    return snpshot.hasData && snpshot.data!.photos!.isNotEmpty
                        ? GridView.builder(
                            physics: const ClampingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 5,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      snpshot.data!.photos![index].src!.medium
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
