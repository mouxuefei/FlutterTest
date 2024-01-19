// 扩展 String 类型
extension ImageLoad on String {
  /// 获取图片全路径
  String get img => 'assets/images/$this';

  /// 获取 icon 全路径
  String get icon => 'assets/icons/$this';
}

///【 使用】
// 直接 . 即可
// Image.asset(
// 'img_01.jpeg'.img,
// ),
// Image.asset(
// 'icon_home.png'.icon,
// // 指定图片宽高
// width: 24,
// height: 24,
// )

