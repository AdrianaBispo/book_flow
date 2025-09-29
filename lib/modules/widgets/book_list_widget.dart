  Widget _buildBookList(List<Book> books, String title) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (books.isEmpty) {
      return Center(
        child: Text('Nenhum livro para exibir.', style: Theme.of(context).textTheme.bodyLarge),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ),
        SizedBox(
          height: 200, // Altura fixa para a lista de livros
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return BookCard(book: book);
            },
          ),
        ),
      ],
    );
  }