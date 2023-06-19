@Entry
@Component
struct SecondPage
{
  @State message: string = '你好'

  build()
  {
    Row()
    {
      Column()
      {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .button()

        this.createText("V has come to.")

        Text("测试扩展样式")
          .textEF()

        Button("测试")
          .normalText()
          .fontColor(Color.Black)
      }
    }
  }

  // 动态页面
  @Builder createText(name: string)
  {
    Text(name)
      .fontSize(20)
      .fontColor(Color.Green)
      .button()
      .normalText()
  }

  // 抽取样式，方便复用，Styles可以放在组件内，也可以放组件外
  @Styles button()
  {
    .width("20%")
    .height(200)
    .backgroundColor(Color.Pink)
  }
}

@Styles function normalText()
{
  .width(200)
  .height(100)
  .backgroundColor(Color.Yellow)
}
// 扩展原生组件
@Extend(Text) function textEF()
{
  .fontColor(Color.Red)
}


