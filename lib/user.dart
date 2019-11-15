import 'package:flutter/widgets.dart';

class User {
  int id;
  String name;
  Account account;

  User({
    @required this.id,
    @required this.name
  });
}

class Account {
  String bank;
  String agency;
  String number;

  Account({
    this.agency,
    this.bank,
    this.number
  });
}