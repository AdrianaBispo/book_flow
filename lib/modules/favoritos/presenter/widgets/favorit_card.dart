import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_colors.dart';

class FavoriteBookCard extends StatelessWidget {
  final String title;
  final String author;
  final String genre;
  final String imageUrl;

  const FavoriteBookCard({
    super.key,
    required this.title,
    required this.author,
    required this.genre,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),

          // 2. Detalhes do Livro
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextTheme.of(
                    context,
                  ).titleSmall!.copyWith(fontFamily: 'PT Serif'),
                ),
                const SizedBox(height: 4),
                Text(
                  author,
                  style: TextTheme.of(
                    context,
                  ).bodySmall!.copyWith(color: AppColors.grey60),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.purple20,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    genre,
                    style: TextTheme.of(context).bodySmall!.copyWith(
                      color: AppColors.primaryPurple,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 150),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: AppColors.primaryPurple,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite,
                color: AppColors.lightBackground,
                size: 16,
              ),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Remover "$title" dos favoritos?')),
              );
            },
          ),
        ],
      ),
    );
  }
}
