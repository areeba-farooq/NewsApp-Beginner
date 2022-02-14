import 'package:flutter/material.dart';
import 'package:news_api_app/NewsApi-Beginner/API%20Manager/api_manager.dart';
import 'package:news_api_app/NewsApi-Beginner/Models/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///created a future variable to get api data
  Future<NewsModel>? _newsModel;

  @override
  void initState() {
    ///here we are calling the method inside the class and assigning it to the future variable above which depends on the FUTURE
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  ///we need to wrap listview in the FUTURE BUILDER
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Center(
            child: Text(
          'Daily News',
        )),
      ),
      body: FutureBuilder<NewsModel>(
        future: _newsModel,

        ///whenever there is a data at that time it will build listview
        builder: (BuildContext context, AsyncSnapshot<NewsModel> snapshot) {
          if (snapshot.hasError) {
            return const Text('something went wrong!');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Internet Lost');
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.articles.length,
              itemBuilder: (context, index) {
                var articles = snapshot.data?.articles[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Card(
                        color: Colors.white70,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: AspectRatio(
                            aspectRatio: 2,
                            child: Image.network(
                              articles!.urlToImage,

                            )),
                      ),
                    ),
                    Text(
                      articles.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      indent: 70,
                      endIndent: 70,
                      thickness: 3,

                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      articles.description,
                      style: const TextStyle(fontSize: 16),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


