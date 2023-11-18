class Movies {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  bool video;
  double voteAverage;

  Movies({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
  });

  factory Movies.fromJson(Map<String, dynamic> json){
    return Movies(
        title: json["title"],
        backDropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        video: json["video"],
        voteAverage: json["vote_average"],
    );
  }

  Map<String, dynamic>toJson() =>{
    "title":title,
  };
}