import 'package:flutter/material.dart';
import 'package:lms/core/utils/styling/app_colors.dart';

class ListTileWidget extends StatefulWidget {
  final String title;
  final IconData trailingIcon;
  final VoidCallback onTap;
  final Color iconColor;
  final Color backgroundColor;
  const ListTileWidget({
    super.key,
    required this.title,
    required this.trailingIcon,
    required this.onTap,
    this.iconColor = mainColor,
    this.backgroundColor = Colors.green,
  });

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: widget.onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        leading: CircleAvatar(
          radius: 20,
          // ignore: deprecated_member_use
          backgroundColor: widget.backgroundColor.withOpacity(0.25),
          child: Icon(
            widget.trailingIcon,
            color: widget.iconColor,
          ),
        ),
        title: Text(
          widget.title,
          style: theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}
