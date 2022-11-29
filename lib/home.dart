import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task5/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listOfStrings = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
    'Category 6',
    'Category 7',
  ];

  List listOfImages = [
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
    'assets/images/two.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Task 5',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const login()));
            },
            icon: Icon(Icons.person),
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset('assets/images/one.png')),
            ],
          ),
          Divider(),

          // Normal List
          Container(
            height: 250,
            //
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(150, 223, 211, 235),
                    ),
                    child: Column(children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            '${listOfImages[index]}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 75, bottom: 7),
                        child: Text('${listOfStrings[index]}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          'Lorem ipusem lorem...',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 5),
                        child: RatingBar.builder(
                          initialRating: 0,
                          itemSize: 20,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ]),
                  ),
                );
              },
              itemCount: listOfImages.length,
            ),
          ),

          Divider(),

          // New arrivals and View more button
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'New Arrivals',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(
                                      width: 1, color: Colors.purple)))),
                      onPressed: () {},
                      child: Text('View More'),
                    ))
              ],
            ),
          ),

          Container(
            height: 225,
            //
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(150, 223, 211, 235),
                    ),
                    child: Column(children: [
                      Stack(children: [
                        Container(
                          width: 150,
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              '${listOfImages[index]}',
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 115),
                          child: FavoriteButton(
                            isFavorite: false,
                            iconDisabledColor: Colors.grey[400],
                            iconColor: Colors.red,
                            iconSize: 50,
                            valueChanged: (_isFavorite) {
                              print('Is Favorite : $_isFavorite');
                            },
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(right: 80, top: 10),
                        child: Text('Title',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Text('Supporting text',
                            style: TextStyle(fontSize: 11)),
                      ),
                    ]),
                  ),
                );
              },
              itemCount: 7,
            ),
          ),
        ]),
      ),
    );
  }
}
