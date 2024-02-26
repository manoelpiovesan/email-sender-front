import 'package:emailsenderfront/consumers/email_consumer.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final EmailConsumer _emailConsumer = EmailConsumer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Sender'),
      ),
      body: Center(
        child: FutureBuilder(
            future: _emailConsumer.getEmails(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading:  Icon(Icons.email, color: snapshot.data[index].status.color),
                      title: Text(snapshot.data[index].email),
                      subtitle: Text(snapshot.data[index].subject),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
