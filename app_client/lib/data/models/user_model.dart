class UserSignModel {
  UserSignModel({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
  });

  String email;
  String password;
  String name;
  String phone;
  String address;
}

class UserCompleteModel {
  UserCompleteModel({
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
  });

  String email;
  String password;
  String phone;
  String address;
}
