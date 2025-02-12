📚 Booksbury
Um aplicativo Flutter desenvolvido para pesquisar livros, favoritar seus livros preferidos e ler diretamente na web utilizando a Google Books API.

✨ Funcionalidades
🔍 Pesquisar livros pelo título ou autor utilizando a Google Books API.
⭐ Favoritar livros para acessar rapidamente seus favoritos.
🌐 Ler online diretamente na página do livro disponibilizada pelo Google.
📱 Interface intuitiva e responsiva, garantindo uma boa experiência para o usuário.
🛠️ Tecnologias Utilizadas
Flutter para desenvolvimento cross-platform (iOS e Android)
Dart como linguagem de programação
Google Books API para busca e informações dos livros
MobX para gerenciamento de estado
flutter_modular para injeção de dependência e organização do projeto
📷 Screenshots
Adicione aqui algumas capturas de tela do app mostrando a tela de busca, lista de favoritos e a página de detalhes de um livro.

🚀 Como Executar o Projeto
Clone este repositório:
bash
Copiar
Editar
git clone https://github.com/seu-usuario/book-finder-app.git
Navegue até o diretório do projeto:
bash
Copiar
Editar
cd book-finder-app
Instale as dependências:
bash
Copiar
Editar
flutter pub get
Execute o aplicativo:
bash
Copiar
Editar
flutter run
📄 Estrutura do Projeto
/lib: Contém todo o código principal do aplicativo.
models/: Modelos de dados (ex: BookModel)
repositories/: Comunicação com a Google Books API
controllers/: Lógica de negócios e gerenciamento de estado (MobX)
pages/: Telas do aplicativo (HomePage, FavoritesPage, etc.)
widgets/: Componentes reutilizáveis do app
📦 API Utilizada
O app utiliza a Google Books API para buscar informações sobre livros.

Exemplo de resposta da API:
json
Copiar
Editar
{
"kind": "books#volume",
"id": "xyz123",
"volumeInfo": {
"title": "Exemplo de Livro",
"authors": ["Autor Exemplo"],
"publishedDate": "2024-01-01",
"description": "Uma breve descrição do livro.",
"imageLinks": {
"thumbnail": "https://link-para-capa-do-livro.jpg"
},
"previewLink": "https://books.google.com/preview?id=xyz123"
}
}
💡 Próximos Passos
🔖 Implementar categorias de livros
📊 Adicionar estatísticas de leitura para os favoritos
🌙 Modo escuro para uma experiência de leitura noturna
📞 Contato
Se tiver dúvidas ou sugestões, fique à vontade para entrar em contato!

📧 Email: rhuanjanau531@gmail.com
🐦 Instagram: @ruan.janau