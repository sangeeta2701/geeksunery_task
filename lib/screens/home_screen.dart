import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynery_assignment/model/movieListData.dart';
import 'package:geeksynery_assignment/utils/colors.dart';
import 'package:geeksynery_assignment/utils/constants.dart';
import 'package:geeksynery_assignment/widgets/sizedbox.dart';
import '../widgets/drawer.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.username});
  final String username;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _getMovieList();
  }

  List<Result> movieList = [];
  Future<void> _getMovieList() async {
    Map<String, dynamic> body = {
      "category": "movies",
      "language": "kannada",
      "genre": "all",
      "sort": "voting"
    };

    final response = await http
        .post(Uri.parse("https://hoblist.com/api/movieList"), body: body);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var _movies = movieListDataFromJson(response.body);

      setState(() {
        movieList = _movies.result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        title: Text(
          "Movie List",
          style: headingStyle,
        ),
        centerTitle: true,
      ),
      drawer: customDrawer(context, widget.username),
      body:movieList.isEmpty?Center(child: CircularProgressIndicator()) :ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          var data = movieList[index];
          return Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "1",
                            style: headingStyle,
                          ),
                          height4,
                          Text(
                            "Vote",
                            style: smallTextStyle,
                          )
                        ],
                      ),
                      width12,
                      Container(
                        height: 100.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(image: NetworkImage(data.poster),fit: BoxFit.cover)),
                      ),
                      width12,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title,style: headingStyle,),
                            infoRow("Genere: ", data.genre),
                            infoRow("Director: ", "${data.director}"),
                            infoRow("Starring", "${data.stars}")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: gColor,
              ),
            ],
          );
        },
      ),
    );
  }
  Widget infoRow(String que, String ans) {
    return Row(
                    children: [
                      Text(que,style: greyText,),
                      width4,
                      Flexible(
                        child: Text(ans,style: smallTextStyle,
                        ),
                      ),
              
                    ],
                  );
  }
}
