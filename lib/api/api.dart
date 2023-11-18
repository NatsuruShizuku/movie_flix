import 'dart:convert';

import '../constants.dart';
import '../models/movies.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/week?api_key=${Constants.apiKey}';
  static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upComingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  Future <List<Movies>>  getTrendingMovies() async{
  final response = await http.get(Uri.parse(_trendingUrl));
  if(response.statusCode == 200 ){
    final decodedData = json.decode(response.body)['results'] as List;
    return decodedData.map((movies) => Movies.fromJson(movies)).toList();
  }
  else{
    throw Exception('เกิดข้อผิดพลาด');
  }
  }

  Future <List<Movies>>  getTopRatedMovies() async{
    final response = await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode == 200 ){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    }
    else{
      throw Exception('เกิดข้อผิดพลาด');
    }
  }

  Future <List<Movies>>  getUpComingMovies() async{
    final response = await http.get(Uri.parse(_upComingUrl));
    if(response.statusCode == 200 ){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    }
    else{
      throw Exception('เกิดข้อผิดพลาด');
    }
  }

}