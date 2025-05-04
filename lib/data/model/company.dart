
class Company {
  final String id ;
  final String name ;
  final String email ;
  final String image ;
  final int v ;

  Company({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.v
  });

  factory Company.fromJson(Map<String,dynamic> json) {
    return Company(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        image: json['image'],
        v: json['__v']
    );
  }
}