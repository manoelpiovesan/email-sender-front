import 'package:emailsenderfront/enums/email_status_enum.dart';

class Email {
  int? id;
  String email = '';
  String subject = '';
  String message = '';
  EmailStatus status = EmailStatus.PENDING;

  ///
  ///
  ///
  Email.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        subject = json['subject'],
        message = json['message'],
        status = EmailStatus.fromString(json['status']);

  ///
  ///
  ///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (id != null) {
      map["id"] = id;
    }

    map["email"] = email;
    map["subject"] = subject;
    map["message"] = message;
    map["status"] = status;

    return map;
  }
}
