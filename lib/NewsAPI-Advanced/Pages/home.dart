import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api_app/NewsAPI-Advanced/Helper/data.dart';
import 'package:news_api_app/NewsAPI-Advanced/Helper/news.dart';
import 'package:news_api_app/NewsAPI-Advanced/Models/article_model.dart';
import 'package:news_api_app/NewsAPI-Advanced/Models/category_model.dart';
import 'articles.dart';
import 'category.dart';


class HomeNews extends StatefulWidget {
  const HomeNews({Key? key}) : super(key: key);

  @override
  _HomeNewsState createState() => _HomeNewsState();
}
class _HomeNewsState extends State<HomeNews> {
  List<CategoryModel> cats = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool loading = true;

///we cannot write like >> articles = News().getNews() because this is the process which will take time so we have to make another async function to call news data
  getNews() async {
    News news = News(); ///class object
    await news.getNews(); ///await until news got getNews()
    articles = news.newsList;
    print(news);
    setState(() {
      loading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    ///fetching categories name and images and save them into the empty list
    cats = getCategory();
    getNews();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ///Categories
              Container(
                height: 72,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: cats.length,
                    itemBuilder: (context, i){
                    return CategoryTile(
                      imageUrl: cats[i].imgUrl,
                      categoryName: cats[i].categoryName,
                    );
                    }),
              ),
              ///Blogs
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
      ),
    );
  }
}
//****************************************************
///category tiles
class CategoryTile extends StatelessWidget {
  final  imageUrl, categoryName;
  const CategoryTile({Key? key,  this.categoryName,  this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            CategoryNewsPage(category: categoryName)) );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  width: 120, height: 70,
                fit: BoxFit.cover,
                imageUrl: imageUrl,)),
            Container(
              width: 120,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Text(categoryName, style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: 1
              ),),
            )
          ],
        ),
      ),
    );
  }
}
//****************************************************
///Blog tiles
class BlogTile extends StatelessWidget {
  const BlogTile({Key? key, required this.imageUrl, required this.url ,required this.description, required this.title}) : super(key: key);
   final String imageUrl, title, description, url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  ArticleView(
          blogUrl: url,
        )));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            const SizedBox(height: 8,),
            Text(title, style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 8,),
            Text(description, style: const TextStyle(
              color: Colors.black54
            ),)
          ],
        ),
      ),
    );
  }
}

