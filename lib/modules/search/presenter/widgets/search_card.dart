import 'package:flutter/material.dart';
import 'package:myapp/core/core.dart';
import 'package:myapp/modules/search/search.dart';

class SearchCard extends StatefulWidget {
  final ResultSearchDto ebook;

  const SearchCard({super.key, required this.ebook});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard>
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
              image: widget.ebook.coverUrl == ''
                  ? DecorationImage(
                      image:
                          const AssetImage(AppAssets.notfound) as ImageProvider,
                      fit: BoxFit.contain,
                    )
                  : DecorationImage(
                      image: NetworkImage(widget.ebook.coverUrl!),
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
                  widget.ebook.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextTheme.of(
                    context,
                  ).titleSmall!.copyWith(fontFamily: 'PT Serif'),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.ebook.author,
                  style: TextTheme.of(
                    context,
                  ).bodySmall!.copyWith(color: AppColors.grey60),
                ),
                const SizedBox(height: 8),
                widget.ebook.genero!.isEmpty
                    ? const SizedBox.shrink()
                    : Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.purple20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.ebook.genero ?? '',
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
                  content: Text('Visualizar livro "${widget.ebook.title}"'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
