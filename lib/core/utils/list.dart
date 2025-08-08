List<T> addOrReplace<T>(
  List<T> list,
  T newItem,
  bool Function(T item) isSameItem,
) {
  final index = list.indexWhere(isSameItem);
  final updated = [...list];

  if (index != -1) {
    updated[index] = newItem; // Replace existing
  } else {
    updated.add(newItem); // Add new
  }

  return updated;
}

List<T> removeBy<T>(
  List<T> list,
  bool Function(T item) match,
) {
  return list.where((item) => !match(item)).toList();
}

T? findBy<T>(List<T> list, bool Function(T item) predicate) {
  for (var item in list) {
    if (predicate(item)) {
      return item;
    }
  }
  return null;
}

List<T> addOrMerge<T>(
  List<T> list,
  T newItem, {
  required bool Function(T existing, T newItem) isSameGroup,
  required void Function(T existing, T newItem) onMerge,
}) {
  final index = list.indexWhere((item) => isSameGroup(item, newItem));

  if (index != -1) {
    // Modify the existing item directly
    onMerge(list[index], newItem);
    return list;
  } else {
    return [...list, newItem];
  }
}

List<T> addChildToGroupedParent<T, C>({
  required List<T> list,
  required C child,
  required bool Function(T parent, C child) isSameGroup,
  required void Function(T parent, C child) onAppendChild,
  required T Function(C child) onCreateNewParent,
}) {
  final index = list.indexWhere((parent) => isSameGroup(parent, child));

  if (index != -1) {
    onAppendChild(list[index], child); // Mutate existing
    return list;
  } else {
    return [...list, onCreateNewParent(child)]; // Add new
  }
}

