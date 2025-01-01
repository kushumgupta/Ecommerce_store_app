import 'package:e_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ESettingMenuTiles extends StatelessWidget {
  const ESettingMenuTiles(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing, this.onTab});

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: EColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTab,
    );
  }
}
