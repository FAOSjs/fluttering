class Question {
  const Question(this.title, this.options);

  final String title;
  final List<String> options;

  List<String> getShuffledAnswers() {
    final listCopy = List.of(options);
    listCopy.shuffle();
    return listCopy;
  }
}
