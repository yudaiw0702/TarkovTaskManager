class ItemData {
  String Name;
  String Image;
  int Counter;
  bool ShouldVisible;

  ItemData({this.Name, this.Image, this.Counter, this.ShouldVisible});
}

List<ItemData> itemData = [
  ItemData(Name: 'FlashDrive', Image: 'Gas_Analyzer_Icon.png', Counter: 1, ShouldVisible: false),
  ItemData(Name: 'Shoes 2', Counter: 1, ShouldVisible: false),
];
