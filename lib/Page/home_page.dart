import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/Page/movie.dart';
import 'package:untitled/Page/movie_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

TextStyle titleStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

class _HomePageState extends State<HomePage> {
  List<listMovie> _listMovie = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    populateMovie(page);
  }

  Future<List<listMovie>> _fetchMovies(int page) async {
    final response = await http.post(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=242346b956cd13fbd0d7e3b0b782c6ce&language=en-US&page=1$page'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result['results'];
      return list.map((e) => listMovie.fromJson(e)).toList();
    } else {
      throw Exception("failed");
    }
  }

  void populateMovie(int page) async {
    final myMovies = await _fetchMovies(page);
    setState(() {
      _listMovie.addAll(myMovies);
    });

    print("populating" + page.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.view_headline_sharp),
        title: Text(
          "Movies",
          style: titleStyle,
        ),
        actions: [
          Padding(padding: EdgeInsets.all(10), child: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                    'https://images.alphacoders.com/440/thumb-350-44051.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Popular", style: titleStyle)),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("See all", style: titleStyle),
                )
              ],
            ),
            Row(
              children: <Widget>[
                _listMovie.isEmpty
                    ? Container(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            height: 270,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: _listMovie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, i) => MovieItems(
                                _listMovie[i].id,
                                _listMovie[i].image,
                                _listMovie[i].title,
                              ),
                              separatorBuilder: (ctx, i) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 270,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: _listMovie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return MovieItems(
                                  _listMovie[index].id,
                                  _listMovie[index].image,
                                  _listMovie[index].title,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 270,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: _listMovie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return MovieItems(
                                  _listMovie[index].id,
                                  _listMovie[index].image,
                                  _listMovie[index].title,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          )
                        ],
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
