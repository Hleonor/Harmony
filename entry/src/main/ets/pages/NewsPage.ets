import http from '@ohos.net.http'
import defaultAppManager from '@ohos.bundle.defaultAppManager'
import { NewsModule } from '../Module/NewsModule'
import router from '@ohos.router'

@Entry
@Component
struct NewsPage {
  @State message: string = 'Hello World'
  @State listData: NewsModule = null

  build()
  {
    if (this.listData != null && this.listData.data != null)
    {
      List()
      {
        ForEach(this.listData.data, (item, index) =>
        {
          ListItem()
          {
            Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center })
            {
              Text(item.title)
                .fontSize(20)
                .fontColor(Color.Black)
                .fontWeight(FontWeight.Bold)
                .margin({ top: 10 })

              Text(item.desc)
                .fontSize(16)
                .fontColor(Color.Black)
                .margin({ top: 10 })

              Image(item.pic)
                .margin({ top: 10 })
            }
          }.margin({ left: 16, right: 16 })
          .backgroundColor(Color.White)
          .margin({ top: 10 })
          .padding(10)
          .onClick(()=>
          {
            router.push({
              url:"pages/BannerDetail",
              params:
              {
                url:item.mobilUrl
              }
            })
          })
        })
      }.margin({ left: 10, right: 10 })
      .backgroundColor("#b5cac5c5")
    }
    else
    {
      Column()
      {
        Text("没有正常输出")
      }
    }

  }

  aboutToAppear()
  {
    this.getData()
  }


  getData()
  {

    let url = "https://api.vvhan.com/api/hotlist?type=zhihuHot"

    // 每一个httpRequest对应一个HTTP请求任务，不可复用
    let httpRequest = http.createHttp();
    // 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
    // 从API 8开始，使用on('headersReceive', Callback)替代on('headerReceive', AsyncCallback)。 8+
    httpRequest.on('headersReceive', (header) =>
    {
      console.info('header: ' + JSON.stringify(header));
    });
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      url,
      {
        method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        },
        // 当使用POST请求时此字段用于传递内容
        extraData: {
          "data": "data to send",
        },
        expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
        usingCache: true, // 可选，默认为true
        priority: 1, // 可选，默认为1
        connectTimeout: 60000, // 可选，默认为60000ms
        readTimeout: 60000, // 可选，默认为60000ms
        usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
      }, (err, data) =>
    {
      if (!err)
      {
        // data.result为HTTP响应内容，可根据业务需要进行解析
        console.info('Result:' + JSON.stringify(data.result));
        /*console.info('code:' + JSON.stringify(data.responseCode));
        // data.header为HTTP响应头，可根据业务需要进行解析
        console.info('header:' + JSON.stringify(data.header));
        console.info('cookies:' + JSON.stringify(data.cookies)); // 8+*/

        this.listData = JSON.parse(data.result.toString())
        // console.info(listData.data.length+"")

      }
      else
      {
        console.info('error:' + JSON.stringify(err));
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁。
        httpRequest.destroy();

      }
    }
    );
  }
}

export default NewsPage




