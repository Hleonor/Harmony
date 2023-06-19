@Entry
@Component
struct TabsPage
{
  @State message: string = 'Hello World'

  controller:TabsController = new TabsController()
  currentIndex = 0
  build()
  {
    Column()
    {
      Tabs({ controller:this.controller })
      {
        TabContent()
        {
          Text("我是首页")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("首页")


        TabContent()
        {
          Text("我是动态")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("动态")

        TabContent()
        {
          Text("我是视频")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("视频")

        TabContent()
        {
          Text("个人主页")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("我的")
        TabContent()
        {
          Text("个人主页")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("我的")
        TabContent()
        {
          Text("个人主页")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("我的")
        TabContent()
        {
          Text("个人主页")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("我的")
        TabContent()
        {
          Text("个人主页")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("我的")
        TabContent()
        {
          Text("个人主页")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("我的")
        TabContent()
        {
          Text("个人主页")
            .fontSize(20)
            .fontColor(Color.Orange)
        }.tabBar("我的")
      }.vertical(false)
      .barWidth(500)
      .barMode(BarMode.Scrollable)
      .height("80%")
      .onChange((index)=>
      {
        console.info("当前页面"+index)
      })

      Flex({justifyContent:FlexAlign.SpaceAround})
      {
        Button("点击切换下一个页面")
          .onClick(() =>
          {
            this.currentIndex++
            this.controller.changeIndex(this.currentIndex)
          })
          .padding(10)

        Button("点击切换上一个页面")
          .onClick(() =>
          {
            this.currentIndex--
            this.controller.changeIndex(this.currentIndex)
          })
          .padding(10)
      }
    }
  }
}