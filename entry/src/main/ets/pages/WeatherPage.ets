import http from '@ohos.net.http'
import defaultAppManager from '@ohos.bundle.defaultAppManager'
import { WeatherReportModule } from '../Module/WeatherReportModule'
import router from '@ohos.router'
import { CityDetail, cityList, Province } from '../Module/CityModule'
import { WeatherForPredictionModule } from '../Module/WeatherForPredictionModule'

@Entry
@Component
struct WeatherPage {
  @State message: string = 'Hello World'
  @State listData: WeatherReportModule = null
  @State listAWeekData: WeatherForPredictionModule = null
  provinceList: []
  @State cityListSelected: Array<SelectOption> = new Array<SelectOption>()
  @State currentCity : string = "北京市"
  @State currentCityIndex : number = 0
  @State currentProvince : number = 0
  @State currentCityDetail : CityDetail = new CityDetail()
  @State currentZipCode : string = "1100" // 默认为北京市

  transList(list:Province[] | CityDetail[])
  {
    let resList = []
    list.forEach((item)=>
    {
      resList.push(
        {
          value: item.name, icon: "/common/public_icon.svg"}
      )
    })
    return resList
  }

  build()
  {
    Column()
    {
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween })
      {
        Text("天气预报")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .padding(10)
        .fontColor(Color.White)

        Flex()
        {
          Image($r("app.media.location2"))
            .height(30)
            .width(30)
            .margin({top: 15 })
          Select(this.transList(cityList))
            .selected(2)
            .value('北京')
            .font({ size: 25, weight: 500 })
            .fontColor('#182431')
            .selectedOptionFont({ size: 16, weight: 400 })
            .optionFont({ size: 16, weight: 400 })
            .onSelect((index: number) =>
            {
              console.info('Select:' + index)
            })
            .margin({ right: 10, top: 10 })
            .backgroundColor("#00")
            .fontColor(Color.White)
            .onSelect((index : number)=>
            {
              this.cityListSelected = this.transList(cityList[index].cities)
              this.currentProvince = index
            })

          Select(this.cityListSelected)
            .selected(2)
            .value(this.currentCity)
            .font({ size: 25, weight: 500 })
            .fontColor('#182431')
            .selectedOptionFont({ size: 16, weight: 400 })
            .optionFont({ size: 16, weight: 400 })
            .onSelect((index: number) =>
            {
              console.info('Select:' + index)
            })
            .margin({left: 10,right: 10, top: 10 })
            .backgroundColor("#00")
            .fontColor(Color.White)
            .onSelect((index : number)=>
            {
              this.currentCity = this.cityListSelected[index].value.toString() // 获取当前城市的名字
              this.currentCityIndex = index
              this.getAWeekData(this.currentCity)
              // 获取邮政编码
              this.currentZipCode = cityList[this.currentProvince].cities[this.currentCityIndex].code

              this.getData() // 刷新当前的天气
            })
        }.margin({left:10})
      }

      if (this.listData != null && this.listData.lives != null)
      {
        Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center })
        {
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center })
          {
            Text(this.listData.lives[0].temperature + "°")
              .fontSize(90)
              .fontWeight(FontWeight.Bold)
              .margin({left:30})
              .fontColor(Color.White)


            Text("均温:" + this.listData.lives[0].temperature_float)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .fontSize(25)
              .margin({left:40})
              .textAlign(TextAlign.Center)

            Text("天气:" + this.listData.lives[0].weather + " " + "风力:" +this.listData.lives[0].windpower)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .fontSize(25)
              .margin({left:10})

            Text("湿度:" + this.listData.lives[0].humidity)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .fontSize(25)
              .margin({left:50})
              .textAlign(TextAlign.Center)
          }
        }.height("40%")
      }
      else
      {
        Text("没有正常输出")
      }


      // 显示未来一周的气温
      if (this.listAWeekData != null && this.listAWeekData.data != null)
      {
        List()
        {
          ForEach(this.listAWeekData.data, (item, index) =>
          {
            ListItem()
            {
              Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent:FlexAlign.Center })
              {
                Text("日期" + item.date + " " + item.week)
                  .fontSize(20)
                  .fontColor(Color.Black)
                  .fontWeight(FontWeight.Bold)
                  .margin({ top: 10 })
                  .textAlign(TextAlign.Center)

                Text(item.type)
                  .fontSize(16)
                  .fontColor(Color.Black)
                  .margin({ top: 10 })
                  .textAlign(TextAlign.Center)
                  .fontSize(20)

                Text("最低气温 " + item.low)
                  .fontSize(16)
                  .fontColor(Color.Black)
                  .margin({ top: 10 })
                  .textAlign(TextAlign.Center)
                  .fontSize(20)

                Text("最高气温 " + item.high)
                  .fontSize(16)
                  .fontColor(Color.Black)
                  .margin({ top: 10 })
                  .textAlign(TextAlign.Center)
                  .fontSize(20)

                Text("风向 " + item.fengxiang)
                  .fontSize(16)
                  .fontColor(Color.Black)
                  .margin({ top: 10 })
                  .textAlign(TextAlign.Center)
                  .fontSize(20)

                Text("风力 " + item.fengli)
                  .fontSize(16)
                  .fontColor(Color.Black)
                  .margin({ top: 10 })
                  .textAlign(TextAlign.Center)
                  .fontSize(20)

              }
            }.margin({ left: 16, right: 16 })
            .backgroundColor(Color.White)
            .margin({ top: 10 })
            .padding(50)
            .borderRadius(20)
            .width("100%")
          })
        }.margin({ left: 10, right: 10 })
        .backgroundColor("#b50a9eee")
        .borderRadius(20)
      }
      /*else
      {
        Column()
        {
          Text("没有正常输出")
        }
      }*/

    }.backgroundImage($r("app.media.weather"))
    .backgroundImageSize({ width: "100%", height: "100%" })
    .height("100%")
  }

  aboutToAppear()
  {
    this.getData()
  }

  getData()
  {

    let url = "https://restapi.amap.com/v3/weather/weatherInfo?city="+ this.currentZipCode+ "00" +"&key=08a538c20f3b7eaae7f041527056efee"

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
        method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
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
        console.info('Result:' + JSON.stringify(data.result));
        this.listData = JSON.parse(data.result.toString())
        /*console.info(this.listData.lives[0].windpower)*/
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

  getAWeekData(name : string)
  {

    name = name.replace("市", "")
    let url = "https://api.vvhan.com/api/weather?city=" + name + "&type=week"

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
        console.info('Result:' + JSON.stringify(data.result));
        this.listAWeekData = JSON.parse(data.result.toString())
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

export default WeatherPage




