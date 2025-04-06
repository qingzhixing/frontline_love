import 'package:flutter_test/flutter_test.dart';

// 测试的函数
int add(int a, int b) {
  return a + b;
}

// 测试代码
void main() {
  test('add function test', () {
    // 断言
    expect(add(1, 2), equals(3));
    expect(add(-1, 1), equals(0));
    expect(add(0, 0), equals(0));
  });
}
