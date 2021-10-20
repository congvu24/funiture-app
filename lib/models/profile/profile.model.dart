import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String phone;
  final String address;
  final String email;
  final String username;
  final String password;

  Profile(
      {required this.name,
      required this.phone,
      required this.address,
      required this.email,
      required this.username,
      required this.password});

  @override
  List<Object?> get props => [name, phone, address, username, email, password];
}
