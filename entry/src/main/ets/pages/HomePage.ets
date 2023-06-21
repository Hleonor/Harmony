import router from '@ohos.router'
import ArrayList from '@ohos.util.ArrayList'
import { CenterModule, createList } from '../Module/CenterModule'
import { createDataList, GoodModule } from '../Module/GoodModule'
import { Test } from './Test'

@Entry
@Component
export struct HomePage {
  @State message: string = ''
  bannerData = [
    {
      "imageUrl": "https://img2.baidu.com/it/u=2206353542,3392555215&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
      "linkUrl": "https://www.baidu.com/"
    },
    {
      "imageUrl": "https://img1.baidu.com/it/u=1612883874,1578735615&fm=253&fmt=auto&app=138&f=PNG?w=889&h=500",
      "linkUrl": "https://www.bilibili.com/?rt=V%2FymTlOu4ow%2Fy4xxNWPUZ5t9UUcGtwbZ8vaYP12X2MA%3D"
    },
    {
      "imageUrl": "https://img0.baidu.com/it/u=2887005296,3821916360&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=281",
      "linkUrl": "https://steamvip.steamact.com/down/steam12?channel=bdth13a&plan=steam&unit=steam&kw=steam"
    },
    {
      "imageUrl": "https://img0.baidu.com/it/u=3494167581,2651410570&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=281",
      "linkUrl": "https://www.jd.com/?cu=true&utm_source=baidu-pinzhuan&utm_medium=cpc&utm_campaign=t_288551095_baidupinzhuan&utm_term=0f3d30c8dba7459bb52f2eb5eba8ac7d_0_14442371e659443fa948384882916f27"
    },
    {
      "imageUrl": "https://img2.baidu.com/it/u=3837163150,3407726212&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
      "linkUrl": "https://h5api.m.taobao.com//h5/mtop.alimama.union.xt.en.api.entry/1.0/_____tmd_____/punish?x5secdata=xd24ad12639ef6f81332b584e4d8879f8c4e780e93350549de1687165309a-717315356a-1061363021abaac2eaa__bx__h5api.m.taobao.com%3A443%2Fh5%2Fmtop.alimama.union.xt.en.api.entry%2F1.0&x5step=2"
    }]
  bannerIndex = 0
  centerData: Array<CenterModule> = createList()
  goodData: Array<GoodModule> = createDataList()
  scrollController: Scroller = new Scroller()

  build()
  {
    Scroll(this.scrollController)
    {
      Column()
      {
        this.Banner()
        this.NaviContent()
        this.FlexItem()
      }
      .padding(10)
    }.height("100%")
    .scrollable(ScrollDirection.Vertical)
    /*Column()
    {
      this.Banner()
      this.NaviContent()
      this.Content()
    }*//*.height("100%")*//*
    .padding(10)*/

  }

  @Builder Banner()
  {
    Swiper()
    {
      ForEach(this.bannerData, (item, index) =>
      {
        Image(item.imageUrl)
          .height(200)
        /*Text(item.linkUrl)
          .fontSize(20)*/
      })
    }
    .width("100%")
    .autoPlay(true)
    .loop(true)
    .cachedCount(2)
    .indicator(true)
    .curve(Curve.Linear)
    .onClick(() =>
    {
      console.info("点击了" + this.bannerData[this.bannerIndex].linkUrl)
      router.push({
        url: "pages/BannerDetail",
        params:
        {
          "url": this.bannerData[this.bannerIndex].linkUrl
        }
      })
    })
    .onChange((index) =>
    {
      this.bannerIndex = index
    })
    .borderRadius(20)
  }

  @Builder NaviContent()
  {
    Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceAround })
    {
      ForEach(this.centerData, (item, index) =>
      {
        Column()
        {
          Image(item.image)
            .width(40)
            .height(40)
          Text(item.name)
            .margin({ top: 10 })
        }.margin({ top: 10 })
      })
    }
  }

  @Builder Content()
  {
      Grid()
      {
        ForEach(this.goodData, (item: GoodModule, index) =>
        {
          GridItem()
          {
            Column()
            {
              // 格子容器
              Image($r("app.media.cartSelect"))
                .height(100)
                .width("100%")
              Text("商品")
                .fontSize(14)
                .margin({ top: 10, bottom: 10 })
              Row()
              {
                Text("价格：")
                  .fontSize(14)

                Text("$" + item.price)
                  .fontSize(14)
                  .fontColor(Color.Red)
              }
            }
          }
          .backgroundColor("#ffefebeb")
          .padding(10)
          .borderRadius(20)
        })
      }
      .columnsTemplate("1fr 1fr")
      .width("100%")
      .columnsGap(10)
      .margin({ top: 10 })
      .rowsGap(10)
      .padding(10)
  }

  @Builder FlexItem()
  {
    Flex({wrap:FlexWrap.Wrap})
    {
      ForEach(this.goodData, (item, index)=>
      {
        Column()
        {
          // 格子容器
          Image(item.image)
            .height(150)
            .width(150)
            .borderRadius(20)
          Text(item.name)
            .fontSize(14)
            .margin({ top: 10, bottom: 10 })
            .textAlign(TextAlign.Center)
          Row()
          {
            Text("价格：")
              .fontSize(14)

            Text("￥" + item.price)
              .fontSize(14)
              .fontColor(Color.Red)
          }
        }.width("40%")
        .margin({left:"5%", right:"5%",top:20})
        .backgroundColor("#00eee1e1")
        .borderRadius(20)
        .padding(5)
      })
    }
  }
}
