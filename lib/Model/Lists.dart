import 'package:wallpaperhub/Model/CategoriesModel.dart';

List<CategoriesModel> getCategoriesList() {
  List<CategoriesModel> _categoriesList = [];

  _categoriesList.add(CategoriesModel(
      title: "Nature",
      imageUrl:
          "https://images.pexels.com/photos/3408744/pexels-photo-3408744.jpeg?auto=compress&cs=tinysrgb&w=600"));
  _categoriesList.add(CategoriesModel(
      title: "Coding",
      imageUrl:
          "https://images.pexels.com/photos/7988086/pexels-photo-7988086.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "Animal",
      imageUrl:
          "https://images.pexels.com/photos/847393/pexels-photo-847393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "House",
      imageUrl:
          "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "Street",
      imageUrl:
          "https://images.pexels.com/photos/1034662/pexels-photo-1034662.jpeg?auto=compress&cs=tinysrgb&w=600"));
  _categoriesList.add(CategoriesModel(
      title: "Actress",
      imageUrl:
          "https://images.pexels.com/photos/6896223/pexels-photo-6896223.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "Technology",
      imageUrl:
          "https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "Food",
      imageUrl:
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));

  return _categoriesList;
}
