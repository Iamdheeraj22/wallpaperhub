import 'package:wallpaperhub/Model/CategoriesModel.dart';

List<CategoriesModel> getCategoriesList() {
  List<CategoriesModel> _categoriesList = [];

  _categoriesList.add(CategoriesModel(
      title: "Nature",
      imageUrl:
          "https://images.pexels.com/photos/2582937/pexels-photo-2582937.jpeg"));
  _categoriesList.add(CategoriesModel(
      title: "Coding",
      imageUrl:
          "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "Animal",
      imageUrl:
          "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "House",
      imageUrl:
          "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "Street",
      imageUrl:
          "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "Actress",
      imageUrl:
          "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "Technology",
      imageUrl:
          "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));
  _categoriesList.add(CategoriesModel(
      title: "Food",
      imageUrl:
          "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"));

  return _categoriesList;
}
