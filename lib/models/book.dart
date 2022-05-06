class Book{

  late String bookImageUrl;
  late String title;
  late String overview;
  late String star;
  late String genre;
  late String author;

  Book({
    required this.title,
    required this.overview,
    required this.bookImageUrl,
    required this.genre,
    required this.star,
    required this.author
  });

}

List<Book> books = [
  Book(
      title: 'To Kill a Mockingbird',
      overview: 'The story, told by the six-year-old Jean Louise Finch, takes place during three years (1933–35) of the Great Depression in the fictional town of Maycomb, Alabama, the seat of Maycomb County. Nicknamed Scout, she lives with her older brother Jeremy, nicknamed Jem, and their widowed father Atticus, a middle-aged lawyer. They also have a Black cook, Calpurnia, who had been with the family for many years and helped Atticus raise the two children. ',
      bookImageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg/800px-To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg',
      genre: 'Southern Gothic',
      star: '⭐⭐⭐⭐⭐',
      author: 'Harper Lee'
  ),
  Book(
      title: 'The Great Gatsby',
      overview: 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick \'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan. ',
      bookImageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg/800px-The_Great_Gatsby_Cover_1925_Retouched.jpg',
      genre: 'Tragedy',
      star: '⭐⭐⭐⭐',
      author: 'F. Scott Fitzgerald'
  ),
  Book(
      title: 'To Kill a Mockingbird',
      overview: 'The story, told by the six-year-old Jean Louise Finch, takes place during three years (1933–35) of the Great Depression in the fictional town of Maycomb, Alabama, the seat of Maycomb County. Nicknamed Scout, she lives with her older brother Jeremy, nicknamed Jem, and their widowed father Atticus, a middle-aged lawyer. They also have a Black cook, Calpurnia, who had been with the family for many years and helped Atticus raise the two children. ',
      bookImageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg/800px-To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg',
      genre: 'Southern Gothic',
      star: '⭐⭐⭐⭐⭐',
      author: 'Harper Lee'
  ),
  Book(
      title: 'The Great Gatsby',
      overview: 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick \'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan. ',
      bookImageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg/800px-The_Great_Gatsby_Cover_1925_Retouched.jpg',
      genre: 'Tragedy',
      star: '⭐⭐⭐⭐',
      author: 'F. Scott Fitzgerald'
  ),
];


