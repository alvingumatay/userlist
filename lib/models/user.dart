class User {
  final int id;
  final String fullname;
  final String mobile;

  User({required this.id, required this.fullname, required this.mobile});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullname: json['fullname'],
      mobile: json['mobile'],
    );
  }

  Map<String, dynamic> toJson() => {
        'fullname': fullname,
        'mobile': mobile,
      };
}
