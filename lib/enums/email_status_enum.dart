// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

///
///
///
enum EmailStatus {
  SENT('Enviado', Colors.green),
  ERROR('Erro', Colors.red),
  PENDING('Pendente', Colors.blue),
  CANCELED('Cancelado', Colors.red);

  final String name;
  final Color color;

  ///
  ///
  ///
  const EmailStatus(this.name, this.color);

  ///
  ///
  ///
  String getName() {
    return name;
  }

  ///
  ///
  ///
  Color getColor() {
    return color;
  }

  ///
  ///
  ///
  static EmailStatus fromString(String name) {
    switch (name) {
      case 'SENT':
        return EmailStatus.SENT;
      case 'ERROR':
        return EmailStatus.ERROR;
      case 'PENDING':
        return EmailStatus.PENDING;
      case 'CANCELED':
        return EmailStatus.CANCELED;
      default:
        return EmailStatus.PENDING;
    }
  }
}
