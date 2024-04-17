class StateList<T extends Object> {
  final List<T> _elements;
  final List<T> _deletedElements;
  final List<T> _addingElements;

  StateList(this._elements): _deletedElements = <T>[], _addingElements = <T>[];
  StateList._(this._elements, this._addingElements, this._deletedElements);

  List<T> get elements => [..._elements];
  List<T> get deletedElements => [..._deletedElements];
  List<T> get addingElements => [..._addingElements];

  void add(T element) {
    if (!_elements.contains(element)) {
      _elements.add(element);
      _addingElements.add(element);
    }
  }

  void remove(T element) {
    if (!_addingElements.contains(element)) {
      _deletedElements.add(element);
    }
    _elements.remove(element);
  }

  StateList<T> copy() {
    return StateList._(elements, addingElements, deletedElements);
  }
}