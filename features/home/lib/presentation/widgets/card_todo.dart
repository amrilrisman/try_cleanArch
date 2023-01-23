import 'package:flutter/material.dart';

class CardTodoItem extends StatelessWidget {
  final String title, subtitle;
  final bool active;
  final Function(bool value) onActived;
  final Function() navigatTo;
  const CardTodoItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.active,
    required this.onActived,
    required this.navigatTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: ListTile(
        onTap: navigatTo,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: Checkbox(
          value: active,
          onChanged: (value) => onActived(active),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
