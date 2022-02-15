import 'package:flutter/material.dart';
import 'package:news_api_app/NewsAPI-Advanced/Helper/news.dart';
import 'package:news_api_app/NewsAPI-Advanced/Models/article_model.dart';

import 'home.dart';

class CategoryNewsPage extends StatefulWidget {
  const CategoryNewsPage({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool loading = true;
  getCatNews() async {
    CategoryNews news = CategoryNews(); ///class object
    await news.getCategoryNews(widget.category); ///await until news got getNews()
    articles = news.newsList;
    print(news);
    setState(() {
      loading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    getCatNews();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black,)
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('News', style: TextStyle(
                color: Colors.blue
            ),),
            Text('-Articles', style: TextStyle(
              color: Colors.black,
            ),),
          ],
        ),
      ),
      body: loading ? const Center(child: CircularProgressIndicator(),) :
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 18),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      description: articles[index].description,
                      title: articles[index].title,
                      url: articles[index].url,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
