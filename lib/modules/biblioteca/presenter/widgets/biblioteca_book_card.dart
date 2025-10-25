import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_colors.dart';

class BibliotecaBookCard extends StatefulWidget {
  final String title;
  final String author;
  final String genre;
  final String imageUrl;

  const BibliotecaBookCard({
    super.key,
    required this.title,
    required this.author,
    required this.genre,
    required this.imageUrl,
  });

  @override
  State<BibliotecaBookCard> createState() => _BibliotecaBookCardState();
}

class _BibliotecaBookCardState extends State<BibliotecaBookCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                image: NetworkImage(widget.imageUrl),
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
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextTheme.of(
                    context,
                  ).titleSmall!.copyWith(fontFamily: 'PT Serif'),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.author,
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
                    widget.genre,
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

          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: AppColors.primaryPurple,
            ),

            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Visualizar livro "${widget.title}"'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
