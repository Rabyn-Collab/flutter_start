


class Book{
  late String imageUrl;
  late String title;
  late String overview;
  late String star;
  late String genre;

  Book({
    required this.title,
    required this.imageUrl,
    required this.overview,
    required this.genre,
    required this.star
});

}

List<Book> books = [
  Book(
      title: 'The Great Gatsby',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg/423px-The_Great_Gatsby_Cover_1925_Retouched.jpg',
      overview: 'The novel was inspired by a youthful romance Fitzgerald had with socialite Ginevra King, and the riotous parties he attended on Long Island\'s North Shore in 1922. Following a move to the French Riviera, Fitzgerald completed a rough draft of the novel in 1924. He submitted it to editor Maxwell Perkins, who persuaded Fitzgerald to revise the work over the following winter. After making revisions, Fitzgerald was satisfied with the text, but remained ambivalent about the book\'s title and considered several alternatives. Painter Francis Cugat\'s cover art greatly impressed Fitzgerald, and he incorporated aspects of it into the novel. ',
      genre: 'Tragedy',
      star: '⭐⭐⭐⭐'
  ),
  Book(
      title: 'To Kill a Mockingbird',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg/800px-To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg',
      overview: 'The story, told by the six-year-old Jean Louise Finch, takes place during three years (1933–35) of the Great Depression in the fictional town of Maycomb, Alabama, the seat of Maycomb County. Nicknamed Scout, she lives with her older brother Jeremy, nicknamed Jem, and their widowed father Atticus, a middle-aged lawyer. They also have a Black cook, Calpurnia, who had been with the family for many years and helped Atticus raise the two children.',
      genre: 'Southern Gothic',
      star: '⭐⭐⭐'
  ),
  Book(
      title: 'The Great Gatsby',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg/423px-The_Great_Gatsby_Cover_1925_Retouched.jpg',
      overview: 'The novel was inspired by a youthful romance Fitzgerald had with socialite Ginevra King, and the riotous parties he attended on Long Island\'s North Shore in 1922. Following a move to the French Riviera, Fitzgerald completed a rough draft of the novel in 1924. He submitted it to editor Maxwell Perkins, who persuaded Fitzgerald to revise the work over the following winter. After making revisions, Fitzgerald was satisfied with the text, but remained ambivalent about the book\'s title and considered several alternatives. Painter Francis Cugat\'s cover art greatly impressed Fitzgerald, and he incorporated aspects of it into the novel. ',
      genre: 'Tragedy',
      star: '⭐⭐⭐⭐'
  ),
  Book(
      title: 'To Kill a Mockingbird',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg/800px-To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg',
      overview: 'The story, told by the six-year-old Jean Louise Finch, takes place during three years (1933–35) of the Great Depression in the fictional town of Maycomb, Alabama, the seat of Maycomb County. Nicknamed Scout, she lives with her older brother Jeremy, nicknamed Jem, and their widowed father Atticus, a middle-aged lawyer. They also have a Black cook, Calpurnia, who had been with the family for many years and helped Atticus raise the two children.',
      genre: 'Southern Gothic',
      star: '⭐⭐⭐'
  ),
];