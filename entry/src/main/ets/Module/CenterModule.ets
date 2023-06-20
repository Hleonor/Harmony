// 中间区域的数据模型
import ArrayList from '@ohos.util.ArrayList'
export class CenterModule {
  name:string
  image:Resource

  constructor(name:string, image:Resource)
    {
      this.name = name
      this.image = image
    }
}

export function createList():Array<CenterModule>
{
  let listData : Array<CenterModule> = new Array()
  listData.push(new CenterModule("限时抢购", $r("app.media.icon")))
  listData.push(new CenterModule("精美服饰", $r("app.media.icon")))
  listData.push(new CenterModule("护肤美妆", $r("app.media.icon")))
  listData.push(new CenterModule("食品饮料", $r("app.media.icon")))
  listData.push(new CenterModule("高级美酒", $r("app.media.icon")))
  listData.push(new CenterModule("限时抢购", $r("app.media.icon")))
  listData.push(new CenterModule("限时抢购", $r("app.media.icon")))
  listData.push(new CenterModule("限时抢购", $r("app.media.icon")))
  listData.push(new CenterModule("限时抢购", $r("app.media.icon")))
  listData.push(new CenterModule("限时抢购", $r("app.media.icon")))
  return listData
}