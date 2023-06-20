import { HomePage } from './HomePage'

@Entry
@Component
struct MainPage
{
  @State message: string = 'Hello World'
  controller: TabsController = new TabsController()
  /*@State currentIndex:number = 0*/
  @State currentIndex: number = 0
  @State currentSelect: number = 0

  build()
  {
    Column()
    {
      this.content()
      this.bottomNavi()
    }
  }

  // 添加网络权限


  @Builder content()
  {
    Tabs({ controller: this.controller })
    {
      TabContent()
      {
        HomePage()
      }.tabBar("首页")

      TabContent()
      {
        Text("这是视频")
      }.tabBar("视频")

      TabContent()
      {
        Text("这是游戏")
      }.tabBar("游戏")

      TabContent()
      {
        Text("这是日常用品")
      }.tabBar("日常用品")
    }
    .height(0)
    .layoutWeight(1)
    .backgroundColor(Color.White)
    .barWidth(0)
    .barHeight(0)
    /*.onChange((index) =>
    {
      this.currentIndex = index
    })*/
  }

  @Builder bottomNavi()
  {
    Row()
    {
      Column()
      {
        if (this.currentIndex == 0)
        {
          Image($r("app.media.homeSelect"))
            .height(20)
            .width(20)
          Text("首页")
        }
        else
        {
          Image($r("app.media.home"))
            .height(20)
            .width(20)
          Text("首页")
        }
      }
      .onClick(() =>
      {
        this.currentIndex = 0
        this.controller.changeIndex(this.currentIndex)
      })
      .layoutWeight(1)

      Column()
      {
        if (this.currentIndex == 1)
        {
          Image($r("app.media.videoSelect"))
            .height(20)
            .width(20)
          Text("视频")
        }
        else
        {
          Image($r("app.media.video"))
            .height(20)
            .width(20)
          Text("视频")
        }
      }
      .onClick(() =>
      {
        this.currentIndex = 1
        this.controller.changeIndex(this.currentIndex)
      })
      .layoutWeight(1)

      Column()
      {
        if (this.currentIndex == 2)
        {
          Image($r("app.media.gameSelect"))
            .height(20)
            .width(20)
          Text("游戏")
        }
        else
        {
          Image($r("app.media.game"))
            .height(20)
            .width(20)
          Text("游戏")
        }
      }
      .onClick(() =>
      {
        this.currentIndex = 2
        this.controller.changeIndex(this.currentIndex)
      })
      .layoutWeight(1)

      Column()
      {
        if (this.currentIndex == 3)
        {
          Image($r("app.media.photoSelect"))
            .height(20)
            .width(20)
          Text("日用品")
        }
        else
        {
          Image($r("app.media.photo"))
            .height(20)
            .width(20)
          Text("日用品")
        }
      }
      .onClick(() =>
      {
        this.currentIndex = 3
        this.controller.changeIndex(this.currentIndex)
      })
      .layoutWeight(1)
    }
    .height(50)
  }
}