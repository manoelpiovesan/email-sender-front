import 'package:emailsenderfront/enums/email_status_enum.dart';

///
///
///
class Email {
  int? id;
  String email = '';
  String subject = '';
  String message = '';
  DateTime? createdAt;
  EmailStatus status = EmailStatus.PENDING;
  ///
  ///
  ///
  Email();

  ///
  ///
  ///
  Email.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        subject = json['subject'],
        message = json['message'],
        createdAt = DateTime.parse(json['createdAt']),
        status = EmailStatus.fromString(json['status']);

  ///
  ///
  ///
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};

    if (id != null) {
      map['id'] = id;
      map['createdAt'] = createdAt;
    }

    map['email'] = email;
    map['subject'] = subject;
    map['message'] = message;
    map['status'] = status.toString();

    return map;
  }
}
