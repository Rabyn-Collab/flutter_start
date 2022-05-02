



class News{

  final String title;
  final String author;
  final String published_date;
  final String summary;
  final String media;
  final String link;


  News({
    required this.title,
    required this.author,
    required this.media,
    required this.published_date,
    required this.summary,
    required this.link
});


  factory News.fromJson(Map<String, dynamic> json){
      return News(
          title: json['title'] ?? '',
          author: json['author'] ?? '',
          media: json['media'] ?? 'assets/noimg.jpg',
          published_date: json['published_date'] ?? '',
          summary: json['summary'] ?? '',
        link:  json['link']
      );
  }



}

