import 'package:flutter/material.dart';
import 'package:morpheus/shared/themes/app_colors.dart';
import 'package:photo_view/photo_view.dart';

class AvatarView extends StatelessWidget {
  final String avatarUrl;
  final String? heroTag;
  const AvatarView({Key? key, required this.avatarUrl, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            PhotoView(
              imageProvider: NetworkImage(avatarUrl),
              heroAttributes: PhotoViewHeroAttributes(tag: heroTag != null ? heroTag as String : avatarUrl),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              color: AppColors.white.withOpacity(0.7),
              iconSize: 40,
            )
          ],
        ),
      ),
    );
  }
}
