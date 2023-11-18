import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_spin/widgets/movie_slider.dart';
import 'package:movie_spin/widgets/trending_slider.dart';

import '../api/api.dart';
import '../models/movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Movies>> trendingMovies;
  late Future<List<Movies>> topRatedMovies;
  late Future<List<Movies>> upComingMovies;

  @override
  void initState(){
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getUpComingMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset('assets/Movieflix.png',fit: BoxFit.cover,height: 90,filterQuality: FilterQuality.high,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'อันดับสูงสุดในวันนี้',
                style: GoogleFonts.prompt(fontSize: 25),
              ),
              const SizedBox(height: 16),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else if(snapshot.hasData){
                      final data = snapshot.data;
                      return TrendingSlider(snapshot: snapshot);
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'กำลังฮิต',
                style: GoogleFonts.prompt(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else if(snapshot.hasData){
                      final data = snapshot.data;
                      return MoviesSlider(snapshot: snapshot);
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

              const SizedBox(height: 32),
              Text(
                'เร็วๆนี้',
                style: GoogleFonts.prompt(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                child: FutureBuilder(
                  future: upComingMovies,
                  builder: (context, snapshot) {
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else if(snapshot.hasData){
                      final data = snapshot.data;
                      return MoviesSlider(snapshot: snapshot);
                    }else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}