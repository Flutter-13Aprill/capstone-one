
class User {
  final int id;
  final String name;
  final String email;
  final String avatar;

  User({required this.id, required this.name, required this.email, required this.avatar});
  factory User.fromJason(Map<String,dynamic>json)=>User(id: json["id"],name: json["name"],email: json["email"],avatar: json["avatar"]);
  Map<String,dynamic> toJson()=>{
    "id":id,
    "name":name,
    "email":email,
    "avatar":avatar
  };
}
//sample list of user 
 List<User> team1 = [
  User(id: 1, name: 'Omar', email: "omar@gmail.com", avatar: "assets/users/person1.png"),
  User(id: 2, name: 'Lina', email: "lina@gmail.com", avatar: "assets/users/person2.jpeg"),
  User(id: 3, name: 'Ali', email: "ali@gmail.com", avatar: "assets/users/person3.jpeg"),
  User(id: 4, name: 'Sara', email: "sara@gmail.com", avatar: "assets/users/person4.jpeg"),
];
