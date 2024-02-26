// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

///
///
///
enum EmailStatus {
  SENT('Enviado', Colors.green, Icons.check),
  ERROR('Erro', Colors.red, Icons.error),
  PENDING('Pendente', Colors.blue, Icons.watch_later),
  CANCELED('Cancelado', Colors.red, Icons.cancel);

  final String name;
  final Color color;
  final IconData iconData;

  ///
  ///
  ///
  const EmailStatus(this.name, this.color, this.iconData);

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
  Widget getIcon() {
    return Icon(iconData, color: color);
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
