import webview from '@ohos.web.webview'
import router from '@ohos.router'
@Entry
@Component
struct BannerDetail
{
  @State message: string = 'Hello World'
  // url = "https://www.bilibili.com/?rt=V%2FymTlOu4ow%2Fy4xxNWPUZ5t9UUcGtwbZ8vaYP12X2MA%3D"
  url = router.getParams()["url"]
  controller: WebviewController = new webview.WebviewController()
  build()
  {
    Column()
    {
      Web({ src: this.url, controller: this.controller }).javaScriptAccess(true)
    }
  }
}