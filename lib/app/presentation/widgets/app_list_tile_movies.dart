import 'package:flutter/material.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/typography.dart';

class AppListTileMovies extends StatelessWidget {
  const AppListTileMovies({
    required this.onTap,
    required this.urlImage,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final void Function() onTap;
  final String urlImage;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.network(
        urlImage,
        errorBuilder:
            (context, error, stackTrace) => CircularProgressIndicator(),
        width: 50,
      ),
      title: Text(title, style: TypographyStyle.questrialSemiBold18),
      subtitle: Text(
        subtitle,
        style: TypographyStyle.questrialRegular14,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
