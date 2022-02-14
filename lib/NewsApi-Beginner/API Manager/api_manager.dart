
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_api_app/NewsApi-Beginner/Constants/constants.dart';
import 'package:news_api_app/NewsApi-Beginner/Models/news_model.dart';
// ignore: camel_case_types
class API_Manager{

  //api calling function
  Future<NewsModel> getNews() async{
    var client = http.Client();
     var newsModel; //null
    try {
      var response = await client.get(Uri.parse(Strings.newsUrl));
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);
         var newsModel = NewsModel.fromJson(jsonMap);
         return newsModel;
      }
    }catch(e){
      print(e);
    }
    return newsModel; //data
  }
}