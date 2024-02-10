class MoviesDataList {
  List<Data>? moviesData;
  Metadata? metadata;

  MoviesDataList({
    this.moviesData,
    this.metadata,
  });


  MoviesDataList.fromJson(Map<String, dynamic> json)
      : moviesData = (json['data']).map((e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        metadata = (json['metadata']) != null ? Metadata.fromJson(json['metadata']) : null;

}

class Data {
  final int? id;
  final String? title;
  final String? poster;
  final String? year;
  final String? country;
  final String? imdbRating;
  final List<String>? genres;
  final List<String>? images;

  Data({
    this.id,
    this.title,
    this.poster,
    this.year,
    this.country,
    this.imdbRating,
    this.genres,
    this.images,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        poster = json['poster'],
        year = json['year'],
        country = json['country'],
        imdbRating = json['imdb_rating'],
        genres = (json['genres']).map((dynamic e) => e as String).toList(),
        images = (json['images']).map((dynamic e) => e as String).toList();


}

class Metadata {
  final String? currentPage;
  final int? perPage;
  final int? pageCount;
  final int? totalCount;

  Metadata({
    this.currentPage,
    this.perPage,
    this.pageCount,
    this.totalCount,
  });

  Metadata.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'],
        perPage = json['per_page'],
        pageCount = json['page_count'],
        totalCount = json['total_count'];

}