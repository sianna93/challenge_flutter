class SongModel{
  final String imagePath;
  String imageUrl = '';
  String title;
  String author = 'Non-Author';
  String song = 'Song';
  String time = "2:40";
  double timeMinutes = 60*3;
  int numberSongs = 0;
  List<String> lyrics = ["Lorem Ipsum is simply dummy text of",
    "the printing and typesetting industry.",
    "Lorem Ipsum has been the industry's standard",
    "dummy text ever since the 1500s,",
    "when an unknown printer took a galley of type",
    "and scrambled it to make a type specimen book.",
    "It has survived not only five centuries,",
    "but also the leap into electronic typesetting,",
    "remaining essentially unchanged.",
    "It was popularised in the 1960s with the release",
    "of Letraset sheets containing",
    "Lorem Ipsum passages, and more recently",
    "with desktop publishing software ",
    "like Aldus PageMaker including",
    "versions of Lorem Ipsum.",
    "**",
    "-END-",
    "",
    "",
    "",
    "",
    "~* Thanks *~"
  ];

  SongModel({required this.imagePath, this.imageUrl = '', required this.title,
    this.author = 'Non-Author',  this.numberSongs = 0, this.timeMinutes = 60*3});
}