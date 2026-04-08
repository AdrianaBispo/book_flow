import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/shared/widgets/widgets.dart';
import 'package:myapp/App/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../presenter/presenter.dart';

class BibliotecaView extends StatefulWidget {
  const BibliotecaView({super.key});

  @override
  State<BibliotecaView> createState() => _BibliotecaViewState();
}

class _BibliotecaViewState extends State<BibliotecaView> {
  @override
  void initState() {
    super.initState();
    context.read<LibraryBloc>().add(LoadLibrary());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.myLibrary),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, size: 24.r),
            onPressed: () => context.read<LibraryBloc>().add(LoadLibrary()),
          ),
        ],
      ),
      body: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          if (state is LibraryLoading) {
            return const LoadingWidget();
          }

          if (state is LibraryFailure) {
            return LibraryErrorWidget(
              onRetry: () => context.read<LibraryBloc>().add(LoadLibrary()),
            );
          }

          if (state is LibraryLoaded) {
            if (state.books.isEmpty) {
              return const LibraryEmptyWidget();
            }

            return LibraryListWidget(books: state.books);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}



