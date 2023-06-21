import { CanvasPage } from './CanvasPage'
import { HomePage } from './HomePage'
import NewsPage from './NewsPage'
import WeatherPage from './WeatherPage'

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
        NewsPage()
      }.tabBar("新闻")

      TabContent()
      {
        CanvasPage()
      }.tabBar("画布")

      TabContent()
      {
        WeatherPage()
      }.tabBar("天气")
    }
    .height(0)
    .layoutWeight(1)
    .backgroundColor(Color.White)
    .barWidth(0)
    .barHeight(0)
    .scrollable(false)
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
          Text("新闻")
        }
        else
        {
          Image($r("app.media.video"))
            .height(20)
            .width(20)
          Text("新闻")
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
          Text("画布")
        }
        else
        {
          Image($r("app.media.game"))
            .height(20)
            .width(20)
          Text("画布")
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
          Text("天气")
        }
        else
        {
          Image($r("app.media.photo"))
            .height(20)
            .width(20)
          Text("天气")
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