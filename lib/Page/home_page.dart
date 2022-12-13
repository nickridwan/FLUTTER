import 'dart:convert';
import 'dart:developer';
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

TextStyle titleStyle = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

class _HomePageState extends State<HomePage> {
  List<listMovie> _listMovie = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    populateMovie(page);
  }

  Future<List<listMovie>> _fetchMovies(int page) async {
    final response = await http.get(Uri.parse(
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
    log("populating ${page.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        leading: const Icon(Icons.view_headline_sharp),
        title: Text(
          "Movies",
          style: titleStyle,
        ),
        actions: const [
          Padding(padding: EdgeInsets.all(10), child: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("Popular", style: titleStyle)),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("See all", style: titleStyle),
                )
              ],
            ),
            Row(
              children: <Widget>[
                _listMovie.isEmpty
                    ? SizedBox(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.white,
                            radius: 30,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: _listMovie.length,
                              scrollDirection: Axis.horizontal,
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
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              itemCount: _listMovie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
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
