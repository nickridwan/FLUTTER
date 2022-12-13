import 'dart:convert';
import 'dart:developer';
<<<<<<< HEAD
=======
import 'dart:ui';
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
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

<<<<<<< HEAD
TextStyle titleStyle = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
=======
TextStyle titleStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0

class _HomePageState extends State<HomePage> {
  List<listMovie> _listMovie = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    populateMovie(page);
  }

  Future<List<listMovie>> _fetchMovies(int page) async {
<<<<<<< HEAD
    final response = await http.get(Uri.parse(
=======
    final response = await http.post(Uri.parse(
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
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
<<<<<<< HEAD
    log("populating ${page.toString()}");
=======

    print("populating" + page.toString());
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
<<<<<<< HEAD
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        leading: const Icon(Icons.view_headline_sharp),
=======
        backgroundColor: Colors.black,
        leading: Icon(Icons.view_headline_sharp),
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
        title: Text(
          "Movies",
          style: titleStyle,
        ),
<<<<<<< HEAD
        actions: const [
=======
        actions: [
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
          Padding(padding: EdgeInsets.all(10), child: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
<<<<<<< HEAD
            Stack(
              children: [
                Image.network(
                  'https://images.alphacoders.com/440/thumb-350-44051.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 55,
                  bottom: 55,
                  left: 140,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          const Color.fromARGB(255, 86, 81, 81).withOpacity(.8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.play_arrow_solid,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
=======
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
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
<<<<<<< HEAD
                    padding: const EdgeInsets.all(10),
                    child: Text("Popular", style: titleStyle)),
                Padding(
                  padding: const EdgeInsets.all(10),
=======
                    padding: EdgeInsets.all(10),
                    child: Text("Popular", style: titleStyle)),
                Padding(
                  padding: EdgeInsets.all(10),
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
                  child: Text("See all", style: titleStyle),
                )
              ],
            ),
            Row(
              children: <Widget>[
                _listMovie.isEmpty
<<<<<<< HEAD
                    ? SizedBox(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.white,
                            radius: 30,
                          ),
=======
                    ? Container(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CircularProgressIndicator(),
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
                        ),
                      )
                    : Column(
                        children: [
<<<<<<< HEAD
                          SizedBox(
                            height: 200,
=======
                          Container(
                            height: 270,
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: _listMovie.length,
                              scrollDirection: Axis.horizontal,
<<<<<<< HEAD
                              itemBuilder: (ctx, i) => Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: MovieItems(
                                  _listMovie[i].id,
                                  _listMovie[i].image,
                                  _listMovie[i].title,
                                ),
                              ),
                              separatorBuilder: (ctx, i) {
                                return const SizedBox(
=======
                              itemBuilder: (ctx, i) => MovieItems(
                                _listMovie[i].id,
                                _listMovie[i].image,
                                _listMovie[i].title,
                              ),
                              separatorBuilder: (ctx, i) {
                                return SizedBox(
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
                                  width: 10,
                                );
                              },
                            ),
                          ),
<<<<<<< HEAD
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: _listMovie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: MovieItems(
                                  _listMovie[index].id,
                                  _listMovie[index].image,
                                  _listMovie[index].title,
                                ),
                              ),
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 200,
=======
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 270,
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: _listMovie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
<<<<<<< HEAD
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: MovieItems(
                                    _listMovie[index].id,
                                    _listMovie[index].image,
                                    _listMovie[index].title,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
=======
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
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
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
