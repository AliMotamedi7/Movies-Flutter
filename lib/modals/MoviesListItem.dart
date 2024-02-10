class MovieListItem {
  List<Data>? mainData;
  Metadata? metadata;

  MovieListItem({this.mainData, this.metadata});

  MovieListItem.fromJson(Map<String, dynamic> json) {
    mainData = json["data"];
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mainData != null) {
      data['data'] = mainData!.map((v) => v.toJson()).toList();
    }
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? poster;
  String? year;
  String? country;
  String? imdbRating;
  List<String>? genres;
  List<String>? images;

  Data(
      {this.id,
        this.title,
        this.poster,
        this.year,
        this.country,
        this.imdbRating,
        this.genres,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    poster = json['poster'];
    year = json['year'];
    country = json['country'];
    imdbRating = json['imdb_rating'];
    genres = json['genres'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> newData = <String, dynamic>{};
    newData['id'] = id;
    newData['title'] = title;
    newData['poster'] = poster;
    newData['year'] = year;
    newData['country'] = country;
    newData['imdb_rating'] = imdbRating;
    newData['genres'] = genres;
    newData['images'] = images;
    return newData;
  }
}

class Metadata {
  String? currentPage;
  int? perPage;
  int? pageCount;
  int? totalCount;

  Metadata({this.currentPage, this.perPage, this.pageCount, this.totalCount});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    perPage = json['per_page'];
    pageCount = json['page_count'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['per_page'] = perPage;
    data['page_count'] = pageCount;
    data['total_count'] = totalCount;
    return data;
  }
}
