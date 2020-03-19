import 'package:flutter/material.dart';
import 'package:movie_ui/movie.dart';
import 'package:movie_ui/movie_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieUi(),
    );
  }
}

class MovieUi extends StatefulWidget {
  @override
  _MovieUiState createState() => _MovieUiState();
}

class _MovieUiState extends State<MovieUi> {
  int selectedIndex = 0;
  List<String> li = ["Now Playing", "Popular", "Coming Soon", "Highly Rated"];

  Widget getList(int index) {
    return GestureDetector(
      onTap: () {
        selectedIndex = index;
        setState(() {});
      },
      /*

RichText(
  text: TextSpan(
    text: 'Hello ',
    style: TextStyle(color:Colors.black),
    children: <TextSpan>[
      TextSpan(text: 'bold', style: TextStyle(color:Colors.red)),
      TextSpan(text: ' world!'),
    ],
  ),
),
      */
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: Color(selectedIndex == index ? 0xffd43c34 : 0xff0c151a),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Text(
            li[index],
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget getMovieList(Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(movieObject: movie)));
      },
      child: Column(
        children: <Widget>[
          Hero(
            tag: movie.imageUrl,
            transitionOnUserGestures: true,
            child: Container(
              height: 200,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(movie.imageUrl), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                movie.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${movie.rating}/10",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                movie.info,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                movie.publisher,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(
            height:25,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.blur_on,
                      size: 26,
                      color: Colors.white,
                    ),
                    Text(
                      "Movie List",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Icon(Icons.search, color: Colors.white, size: 28)
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: li.toList().asMap().entries.map((MapEntry map) {
                      //print(map);
                      return getList(map.key);
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: movieList.asMap().entries.map((MapEntry map) {
                        return getMovieList(map.value);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
