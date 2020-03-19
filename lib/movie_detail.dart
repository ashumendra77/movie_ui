import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

import 'movie.dart';
/*  class MovieDetail extends StatelessWidget {
   final Movie movieObject;
   MovieDetail({@required this.movieObject});
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: MovieDetails(movieObject),
       
     );
   }
 } */

class MovieDetails extends StatefulWidget {
  final Movie movieObject;
  MovieDetails({@required this.movieObject});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        // color: Colors.blue,
        margin: EdgeInsets.only(top: 17, left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: widget.movieObject.imageUrl,
                  transitionOnUserGestures: true,
                  child: Container(
                    height: 330,
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(widget.movieObject.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  height: 330.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.center,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 10,
                  left: 10,
                  bottom: null,
                  right: null,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Icon(
                              Icons.play_arrow,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            offset: Offset(0.2, 0.3),
                            blurRadius: 4,
                            spreadRadius: 3,
                          )
                        ]),
                        child: Text(
                          "Watch Trailer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.movieObject.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      RatingBar.readOnly(
                        initialRating: 5 / (10 / widget.movieObject.rating),
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        filledColor: Colors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.movieObject.info,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.movieObject.description,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        margin: EdgeInsets.all(20),
                        child: RaisedButton(
                          child: Text('BUY TICKET'),
                          color: Colors.red,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
