import 'package:emailsenderfront/consumers/email_consumer.dart';
import 'package:emailsenderfront/models/email_model.dart';
import 'package:flutter/material.dart';

class EmailList extends StatefulWidget {
  const EmailList({super.key});

  @override
  State<EmailList> createState() => _EmailListState();
}

class _EmailListState extends State<EmailList> {
  final EmailConsumer _emailConsumer = EmailConsumer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Email>>(
      future: _emailConsumer.getEmails(),
      builder: (BuildContext context, AsyncSnapshot<List<Email>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(
                  Icons.email,
                  color: snapshot.data![index].status.color,
                ),
                title: Text(snapshot.data![index].email),
                subtitle: Row(
                  children: <Widget>[
                    Text(snapshot.data![index].createdAt.toString()),
                    const SizedBox(width: 10),
                    Text(snapshot.data![index].subject),
                  ],
                ),
                trailing: Text(snapshot.data![index].status.name),
              );
            },
          );
        }
      },
    );
  }
}
