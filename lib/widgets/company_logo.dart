import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  final double? fontSize;
  final Color? textColor;

  const CompanyLogo({
    super.key,
    this.fontSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: fontSize != null ? fontSize! * 1.5 : 36,
          height: fontSize != null ? fontSize! * 1.5 : 36,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.cleaning_services_outlined,
            color: theme.colorScheme.onPrimary,
            size: fontSize != null ? fontSize! * 0.8 : 20,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Servicios de Limpiezas Alpha',
          style: TextStyle(
            fontSize: fontSize ?? 24,
            fontWeight: FontWeight.bold,
            color: textColor ?? theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
