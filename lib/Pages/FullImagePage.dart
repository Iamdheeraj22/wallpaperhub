import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaperhub/Model/PhotosDataModel.dart';

class FullImagePage extends StatefulWidget {
  PhotosDataModel? model;
  FullImagePage({Key? key, required this.model}) : super(key: key);

  @override
  State<FullImagePage> createState() => _FullImagePageState();
}

class _FullImagePageState extends State<FullImagePage> {
  String imgUrl = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          widget.model!.src!.portrait.toString(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
