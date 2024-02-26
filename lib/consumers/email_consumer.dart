import 'dart:convert';

import 'package:emailsenderfront/models/email_model.dart';
import 'package:emailsenderfront/utils/config.dart';
import 'package:http/http.dart';

///
///
///
class EmailConsumer {
  ///
  ///
  ///
  Future<List<Email>> getEmails() async {
    final Response response = await get(
      Uri.parse(<String>[Config.API_URL, 'email'].join('/')),
    );

    final List<Email> emails = <Email>[];
    for (final Map<String, dynamic> emailMap in json.decode(response.body)) {
      emails.add(Email.fromJson(emailMap));
    }

    return emails;
  }
}
