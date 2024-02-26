import 'package:emailsenderfront/consumers/email_consumer.dart';
import 'package:emailsenderfront/models/email_model.dart';
import 'package:emailsenderfront/views/details/email_details.dart';
import 'package:emailsenderfront/views/form/email_form.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Enviados',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                children: <Widget>[
                  TextButton(
                    onPressed: writeAnEmail,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.add),
                        Text(
                          'Novo Email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Email>>(
            future: _emailConsumer.getEmails(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Email>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          navigateToEmailDetails(snapshot.data![index]);
                        },
                        // leading: Icon(
                        //   Icons.email,
                        //   color: snapshot.data![index].status.color,
                        // ),
                        title: Row(
                          children: <Widget>[
                            Text(snapshot.data![index].message),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward,
                              size: 12,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              snapshot.data![index].email,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Text('${snapshot.data![index].createdAt!.day}'
                                '/${snapshot.data![index].createdAt!.month}'
                                '/${snapshot.data![index].createdAt!.year}'),
                            const SizedBox(width: 10),
                            Text(snapshot.data![index].subject),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            snapshot.data![index].status.getIcon(),
                            const SizedBox(width: 6),
                            Text(
                              snapshot.data![index].status.name,
                              style: TextStyle(
                                color: snapshot.data![index].status.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Future<void> writeAnEmail() async {
    await Navigator.of(context).push(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) {
          return const EmailForm();
        },
      ),
    );

    setState(() {});
  }

  Future<void> navigateToEmailDetails(Email email) async {
    await Navigator.of(context).push(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) {
          return EmailDetail(email: email);
        },
      ),
    );

    setState(() {});
  }
}
