@Entry
@Component
struct ListPage
{
  @State message: string = 'Hello World'
  // 数据源
  dataList = [{ "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" },
    { "name": "苹果", "price": "10.5元" }]

  build()
  {
    List()
    {
      // list container
      ForEach(this.dataList, (item, index) =>
      {
        ListItem()
        {
          // 列表项，可以放置容器
          Row()
          {
            Text(item.name)
              .fontColor(Color.Black)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
            Text(item.price)
              .fontColor(Color.Red)
              .layoutWeight(1)
              .textAlign(TextAlign.End)
              .margin({right:20})
            Image($r("app.media.icon"))
              .width(100)
              .height(100)
          }.margin({ left: 16, right: 16 })
          .padding(10)
        }
      })
    }
  }
}