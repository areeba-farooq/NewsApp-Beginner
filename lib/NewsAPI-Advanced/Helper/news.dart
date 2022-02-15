import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api_app/NewsAPI-Advanced/Models/article_model.dart';
class News{
  List<ArticleModel> newsList = <ArticleModel>[]; //empty list



  //getting the news data from this api function
  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=59c5099cbfeb40d886a683aa8ef51da0";
    try{
      var res = await http.get(Uri.parse(url));
      var jsonMap = jsonDecode(res.body);
      if(jsonMap['status'] == "ok"){
        // go for each element data in the articles
        jsonMap['articles'].forEach((element){
          //checking if these are not null
          if(element['urlToImage'] != null && element["description"] != null){
            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              publishedAt: element['publishedAt'],
              urlToImage: element['urlToImage'],
              url: element['url']
            );
            newsList.add(articleModel);

          }

        });
      }

    }catch(e){
      print(e);
    }

  }
}

//category
class CategoryNews{
  List<ArticleModel> newsList = <ArticleModel>[]; //empty list

  //getting the news data from this api function
  Future<void> getCategoryNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=59c5099cbfeb40d886a683aa8ef51da0";
    try{
      var res = await http.get(Uri.parse(url));
      var jsonMap = jsonDecode(res.body);
      if(jsonMap['status'] == "ok"){
        // go for each element data in the articles
        jsonMap['articles'].forEach((element){
          //checking if these are not null
          if(element['urlToImage'] != null && element["description"] != null){
            ArticleModel articleModel = ArticleModel(
                title: element['title'],
                description: element['description'],
                publishedAt: element['publishedAt'],
                urlToImage: element['urlToImage'],
                url: element['url']
            );
            newsList.add(articleModel);

          }

        });
      }

    }catch(e){
      print(e);
    }

  }
}