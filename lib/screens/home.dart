import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var loadData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final url =
        'https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34';

    try {
      setState(() {
        _isLoading = true;
      });
      final response = await http.get(
        url,
      );
      loadData = json.decode(response.body);
      print(loadData);
      if (loadData == null) {
        return;
      }

      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 200.0,
                          width: double.infinity,
                          child: Carousel(
                            images: [
                              NetworkImage(
                                  "https://cdn.pixabay.com/photo/2017/07/27/02/23/space-2543838_1280.jpg"),
                              NetworkImage(
                                  "https://cdn.pixabay.com/photo/2017/03/02/15/21/night-view-2111569_960_720.jpg"),
                              NetworkImage(
                                  "https://cdn.pixabay.com/photo/2020/04/16/12/38/passing-cars-5050426__340.jpg"),
                              NetworkImage(
                                  "https://cdn.pixabay.com/photo/2019/09/02/12/20/spa-4447094__340.jpg"),
                            ],
                            dotSize: 6.0,
                            dotSpacing: 15.0,
                            dotColor: Colors.grey[600],
                            indicatorBgPadding: 8.0,
                            dotBgColor: Colors.transparent,
                            dotPosition: DotPosition.bottomLeft,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 5,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 5,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'موسيقى #',
                        style: TextStyle(fontSize: 20, color: Colors.grey[400]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8),
                      child: Text(
                        loadData['interest'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            loadData['date'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]),
                          ),
                          Icon(
                            Icons.date_range,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            loadData['address'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]),
                          ),
                          Icon(
                            (Icons.location_on),
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                      indent: 1,
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            loadData['trainerName'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2017/07/27/02/23/space-2543838_1280.jpg'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        loadData['trainerInfo'],
                        style: TextStyle(fontSize: 20, color: Colors.grey[400]),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                      indent: 1,
                      thickness: 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        'عن الدورة',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 300,
                      child: Text(
                        loadData['occasionDetail'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                      indent: 1,
                      thickness: 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        'تكلفة الدورة',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                loadData['price'].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                'الحجز العادى',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                loadData['price'].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                'الحجز المميز',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                loadData['price'].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                'الحجز السريع',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          'قم بالحجز الان',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
