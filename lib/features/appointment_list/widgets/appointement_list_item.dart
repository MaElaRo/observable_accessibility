import 'package:flutter/material.dart';

class AppointmentListItem extends StatelessWidget {
  const AppointmentListItem({
    this.onTap,
    super.key,
    required this.name,
    required this.date,
    required this.time,
  });

  final VoidCallback? onTap;

  final String name;

  final DateTime date;

  final String time;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedCard(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      name,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    Text(
                      date.toIso8601String(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: onTap, icon: const Icon(Icons.delete),),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({
    required this.child,
    this.onTap,
    this.padding,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 3,
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}
