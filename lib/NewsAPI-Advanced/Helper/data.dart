
//Category function which return a list of CategoryModels
import 'package:news_api_app/NewsAPI-Advanced/Models/category_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> category = <CategoryModel>[]; //this will return
  CategoryModel categoryModel = CategoryModel(); //class object instance

  //1st category
  categoryModel = CategoryModel();
  categoryModel.categoryName = "business";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YnVzaW5lc3N8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60";
  category.add(categoryModel); // adding into the list

  //2nd category
  categoryModel = CategoryModel();
  categoryModel.categoryName = "sports";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1517649763962-0c623066013b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3BvcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60";
  category.add(categoryModel); // adding into the list

  //3rd category
  categoryModel = CategoryModel();
  categoryModel.categoryName = "technology";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel); // adding into the list

  //4th category
  categoryModel = CategoryModel();
  categoryModel.categoryName = "general";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel); // adding into the list

  //5th category
  categoryModel = CategoryModel();
  categoryModel.categoryName = "entertainment";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZW50ZXJ0YWlubWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60";
  category.add(categoryModel); // adding into the list

  //6th
  categoryModel = CategoryModel();
  categoryModel.categoryName = "science";
  categoryModel.imgUrl =
  "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YnVzaW5lc3N8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60";
  category.add(categoryModel);

  //7th
  categoryModel = CategoryModel();
  categoryModel.categoryName = "health";
  categoryModel.imgUrl =
  "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YnVzaW5lc3N8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60";
  category.add(categoryModel);

  return category;
}
