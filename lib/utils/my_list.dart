class DBList<T extends Object>{
  final List<T> addingElements;
  final List<T> deletedElements;
  final List<T> currentElements;

  List<T> get elements => [...currentElements, ...addingElements];

  DBList(this.currentElements): addingElements = <T>[], deletedElements = <T>[];

  void add(T element) {
    if (!currentElements.contains(element)) addingElements.add(element);
  }

  void addAll(List<T> elements) {
    for (var element in elements) {
      add(element);
    }
  }

  void remove(T element) {
    if (currentElements.contains(element)) {
      deletedElements.add(element);
      currentElements.remove(element);
    }
  }

  factory DBList.empty() {
    return DBList<T>([]);
  }
}