class ChatUser {
  ChatUser({
    required this.about,
    required this.name,
    required this.id,
    required this.email,
    required this.createAt,
    required this.image,
  });
  late final String about;
  late final String name;
  late final String id;
  late final String email;
  late final String createAt;
  late final String image;

  ChatUser.fromJson(Map<String, dynamic> json) {
    about = json['about'] ?? '';
    name = json['name'] ?? '';
    id = json['id'] ?? '';
    email = json['email'] ?? '';
    createAt = json['createAt'] ?? '';
    image = json['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['about'] = about;
    data['name'] = name;
    data['id'] = id;
    data['email'] = email;
    data['createAt'] = createAt;
    data['image'] = image;
    return data;
  }
}
