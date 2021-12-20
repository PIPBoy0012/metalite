class PostModel {
  final String title;
  final String describstion;
  final String image;
  PostModel({
    required this.title,
    required this.describstion,
    required this.image,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return new PostModel(
        title: json['title'],
        describstion: json['describstion'],
        image: json['image']);
  }
}
