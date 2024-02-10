import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/services/moviesService.dart';
import 'package:movies_app/widgets/moviesList.dart';
import 'package:shimmer/shimmer.dart';
import '../modals/Genres.dart';
import '../widgets/dotIndicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _search = TextEditingController();

  bool shimmer = false;

  TabController? _tabController;

  List<String> movies = [
    'assets/images/movie1.jpg',
    'assets/images/movie2.jpg',
    'assets/images/movie3.jpg',
    'assets/images/movie4.jpg',
    'assets/images/movie6.jpg',
    'assets/images/movie7.jpg',
    'assets/images/movie8.jpg',
  ];

  List<String> moviesName = [
    'The revenant',
    'Cover versions',
    'Avengers endgame',
    'Mission Impossible',
    'The do over',
    'Ausloschung',
    'Significant other',
  ];

  int currentPageIndex = 0;

  var jsonList;
  var genreList;

  @override
  void dispose() {
    // TODO: implement dispose
    _search.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getMoviesByGenre();
    MoviesService.fetchGenres();
    _tabController = TabController(length: 21, vsync: this);
  }

  void getData() async {
    Dio dio = Dio();
    Response response =
        await dio.get("https://moviesapi.ir/api/v1/movies?page=1");
    setState(() {
      jsonList = response.data["data"] as List;
    });
  }

  void getMoviesByGenre() async {
    Dio dio = Dio();
    Response response = await dio.get(
      "https://moviesapi.ir/api/v1/genres/3/movies?page=1",
      data: {
        "genre_id": 3,
      },
    );
    setState(() {
      genreList = response.data["data"] as List;
    });
  }

  Future<void> _refresh() {
    setState(() {
      shimmer = true;
    });
    return Future.delayed(const Duration(seconds: 3)).then((value) {
      setState(() {
        shimmer = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: SnakeNavigationBar.color(
            snakeShape: SnakeShape.circle,
            height: 50,
            currentIndex: currentPageIndex,
            onTap: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                activeIcon: Icon(Icons.person_2),
              ),
            ],
          ),
        ),
        /////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 25.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Movies",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25.0, top: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: TextField(
                        controller: _search,
                        style: GoogleFonts.kanit(),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: GoogleFonts.raleway(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  /////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////
                  Text(
                    "Genre",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.42,
                    child: FutureBuilder<List<Genres>>(
                        future: MoviesService.fetchGenres(),
                        builder: (context, snapshot) {
                          List<Genres?> genre = snapshot.data ?? [];
                          return DefaultTabController(
                            length: genre.length,
                            child: Column(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                        right: 25, top: 20),
                                    padding: const EdgeInsets.only(bottom: 7),
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TabBar(
                                        isScrollable: true,
                                        indicator: const DotIndicator(),
                                        labelColor: Colors.black,
                                        dividerColor: Colors.transparent,
                                        labelStyle: GoogleFonts.raleway(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                        tabs: List.generate(
                                            genre.length,
                                            (index) => Tab(
                                                  text: genre[index]?.name,
                                                )))),
                                Expanded(
                                  child: TabBarView(
                                    children: List.generate(
                                        genre.length,
                                        (index) => ListView.builder(
                                            itemCount: genreList == null
                                                ? 0
                                                : genreList.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return shimmer
                                                  ? Shimmer.fromColors(
                                                      baseColor: Colors.white,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      child: MoviesList(
                                                          movies:
                                                              genreList[index]
                                                                  ["poster"],
                                                          movieName:
                                                              genreList[index]
                                                                  ["title"]))
                                                  : MoviesList(
                                                      movies: genreList[index]
                                                          ["poster"],
                                                      movieName:
                                                          genreList[index]
                                                              ["title"]);
                                            })),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  /////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////
                  Text(
                    "Trends",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: jsonList == null ? 0 : jsonList.length,
                      itemBuilder: (context, index) {
                        return shimmer
                            ? Shimmer.fromColors(
                                baseColor: Colors.white,
                                highlightColor: Colors.transparent,
                                child: MoviesList(
                                    movies: jsonList[index]["poster"],
                                    movieName: jsonList[index]["title"]),
                              )
                            : MoviesList(
                                movies: jsonList[index]["poster"],
                                movieName: jsonList[index]["title"]);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
