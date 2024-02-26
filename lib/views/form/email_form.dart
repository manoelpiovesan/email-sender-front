import 'package:emailsenderfront/consumers/email_consumer.dart';
import 'package:emailsenderfront/models/email_model.dart';
import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Email _email = Email();
  final EmailConsumer _emailConsumer = EmailConsumer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: <Widget>[
            Icon(Icons.email),
            SizedBox(width: 10),
            Text(
              'EmailSender',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: <Widget>[
              TextFormField(
                onSaved: (String? value) => _email.email = value!,
                decoration: const InputDecoration(
                  labelText: 'Para',
                  hintText: 'Email do destinatário',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onSaved: (String? value) => _email.subject = value!,
                decoration: const InputDecoration(
                  labelText: 'Assunto',
                  hintText: 'Assunto do email',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onSaved: (String? value) => _email.message = value!,
                decoration: const InputDecoration(
                  labelText: 'Mensagem',
                  hintText: 'Corpo do email',
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _emailConsumer.sendEmail(_email);

                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
