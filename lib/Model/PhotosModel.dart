import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperhub/Model/PhotosDataModel.dart';
import 'package:wallpaperhub/Widgets.dart';
import 'package:wallpaperhub/app_config/app_constants.dart';

Future<PhotosModel> getAllPhotos(
  BuildContext context, {
  String search = "",
  String page = "1",
  String limit = "1000",
  bool isShow = true,
}) async {
  if (isShow) {
    showProgressDialogBox(context);
  }
  var jsonResponse = null;

  var response = await http.get(
    Uri.parse("${AppConstants.baseUrl}curated?page=$page&per_page=$limit"),
    headers: {'Authorization': AppConstants.apiKey},
  );

  print(response.body);
  jsonResponse = json.decode(response.body);
  var message = jsonResponse["message"];
  if (isShow) {
    Navigator.pop(context);
  }
  if (response.statusCode == 200) {
    print("Get All photos api success");
    return PhotosModel.fromJson(jsonDecode(response.body));
  } else {
    customToastMsg(message);
    throw Exception("Failed to load the work experience!");
  }
}

Future<PhotosModel> getAllSearchPhotos(
  BuildContext context, {
  String search = "",
  String page = "1",
  String limit = "1000",
  bool isShow = true,
}) async {
  if (isShow) {
    showProgressDialogBox(context);
  }
  var jsonResponse = null;

  var response = await http.get(
    Uri.parse(
      "${AppConstants.baseUrl}search?query=$search&page=$page&per_page=$limit",
    ),
    headers: {'Authorization': AppConstants.apiKey},
  );

  print(response.body);
  jsonResponse = json.decode(response.body);
  var message = jsonResponse["message"];
  if (isShow) {
    Navigator.pop(context);
  }
  if (response.statusCode == 200) {
    print("Get All photos api success");
    return PhotosModel.fromJson(jsonDecode(response.body));
  } else {
    customToastMsg(message);
    throw Exception("Failed to load the work experience!");
  }
}

class PhotosModel {
  int? page;
  int? perPage;
  List<PhotosDataModel>? photos;
  var totalResults;
  String? nextPage;

  PhotosModel({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
  });

  PhotosModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    if (json['photos'] != null) {
      photos = <PhotosDataModel>[];
      json['photos'].forEach((v) {
        photos!.add(new PhotosDataModel.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['total_results'] = totalResults;
    data['next_page'] = nextPage;
    return data;
  }
}
