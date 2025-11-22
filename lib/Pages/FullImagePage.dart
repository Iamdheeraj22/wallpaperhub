import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:wallpaperhub/Model/PhotosDataModel.dart';
import 'package:wallpaperhub/Widgets.dart';

class FullImagePage extends StatefulWidget {
  PhotosDataModel? model;
  FullImagePage({Key? key, required this.model}) : super(key: key);

  @override
  State<FullImagePage> createState() => _FullImagePageState();
}

class _FullImagePageState extends State<FullImagePage> {
  var groupValue = 5;
  var imgSizes = [
    "original",
    "large2x",
    "large",
    "medium",
    "small",
    "portrait",
    "landscape",
    "tiny"
  ];
  String imgUrl = "";
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
    setTheImageUrl(groupValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: imgUrl,
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
                      height: getHeight(context),
                      width: getWidth(context),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        showImageQualities();
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          width: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(157, 158, 158, 158),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          margin: EdgeInsets.only(top: getHeight(context) / 2),
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(Icons.arrow_back_ios))),
                    ),
                  ),
                ],
              ),
              Align(
                  child: InkWell(
                onTap: () {
                  _save();
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(115, 158, 158, 158),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/download.png",
                        height: 25,
                        width: 25,
                      ),
                      customBox(width: 10),
                      Text("Download Wallpaper")
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  showImageQualities() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        context: context,
        builder: (builder) {
          return StatefulBuilder(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      customBox(width: 15),
                      const Text(
                        "Select image quality",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          )),
                      customBox(width: 15)
                    ],
                  ),
                  customBox(height: 5),
                  Container(
                    color: Colors.black,
                    height: 1,
                  ),
                  customBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: imgSizes.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RadioListTile(
                            title: Text(
                              imgSizes[index].toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            groupValue: groupValue,
                            value: index,
                            onChanged: (v) {
                              state(() {
                                groupValue = index;
                                setTheImageUrl(groupValue);
                              });
                            },
                          );
                        }),
                  ),
                ],
              );
            },
          );
        });
  }

  void setTheImageUrl(int groupV) {
    if (groupV == 0) {
      setState(() {
        imgUrl = widget.model!.src!.original.toString();
      });
    } else if (groupV == 1) {
      setState(() {
        imgUrl = widget.model!.src!.large2x.toString();
      });
    } else if (groupV == 2) {
      setState(() {
        imgUrl = widget.model!.src!.large.toString();
      });
    } else if (groupV == 3) {
      setState(() {
        imgUrl = widget.model!.src!.medium.toString();
      });
    } else if (groupV == 4) {
      setState(() {
        imgUrl = widget.model!.src!.small.toString();
      });
    } else if (groupV == 5) {
      setState(() {
        imgUrl = widget.model!.src!.portrait.toString();
      });
    } else if (groupV == 6) {
      setState(() {
        imgUrl = widget.model!.src!.landscape.toString();
      });
    } else if (groupV == 7) {
      setState(() {
        imgUrl = widget.model!.src!.tiny.toString();
      });
    }
  }

  _save() async {
    Random random = Random();
/*    var tagPhoto = random.nextInt(10000);
    var response = await Dio()
        .get(imgUrl, options: Options(responseType: ResponseType.bytes));
    final result = await GallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 100,
        name: "Wallpaper-" + tagPhoto.toString());
    print(result);*/
    showBottomSheetforWllper();
  }

  showBottomSheetforWllper() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        context: context,
        builder: (builder) {
          return StatefulBuilder(builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  customBox(height: 15),
                  Text(
                    "Do you you want to set as a wallpaper?",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Yes")),
                      ElevatedButton(onPressed: () {}, child: Text("No"))
                    ],
                  )
                ],
              ),
            );
          });
        });
  }
}
