class ObjectPool<T> {
  final int maxSize;
  final List<T> _pool = [];
  final T Function() createObject;

  ObjectPool(this.maxSize, this.createObject);

  T get() {
    if (_pool.isNotEmpty) {
      return _pool.removeLast();
    }
    return createObject();
  }

  void release(T object) {
    if (_pool.length < maxSize) {
      _pool.add(object);
    } else {
      // 这里可以添加对对象的销毁逻辑，不过泛型情况下较难有通用销毁逻辑
      // 可根据具体类型在外部手动处理
    }
  }

  void dispose() {
    _pool.clear();
  }
}
