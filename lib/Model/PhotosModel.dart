import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallpaperhub/AuthenticAtion/ApiConstant.dart';
import 'package:wallpaperhub/Model/PhotosDataModel.dart';
import 'package:wallpaperhub/Widgets.dart';

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

  var response = await http
      .get(Uri.parse(BaseUrl + "curated?page=$page&per_page=$limit"), headers: {
    'Authorization': api_key,
  });

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
      Uri.parse(BaseUrl + "search?query=$search&page=$page&per_page=$limit"),
      headers: {
        'Authorization': api_key,
      });

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

  PhotosModel(
      {this.page, this.perPage, this.photos, this.totalResults, this.nextPage});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    data['total_results'] = this.totalResults;
    data['next_page'] = this.nextPage;
    return data;
  }
}
