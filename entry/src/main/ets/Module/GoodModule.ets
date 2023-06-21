import ArrayList from '@ohos.util.ArrayList'
import { createList } from './CenterModule'
export class GoodModule
{
  name: string
  price: string
  image: Resource

  constructor(params: {
    name: string
    price: string
    image: Resource
  })
  {
    this.name = params.name
    this.price = params.price
    this.image = params.image
  }
}

export function createDataList():Array<GoodModule>
{
  let listData = new Array<GoodModule>()
  listData.push(new GoodModule({name:"鬼泣5", price:"24.99", image:$r("app.media.DMC5")}))
  listData.push(new GoodModule({name:"生化危机4：重置版", price:"24.99", image:$r("app.media.RE4")}))
  listData.push(new GoodModule({name:"合金装备3：重制版", price:"24.99", image:$r("app.media.MGS3")}))
  listData.push(new GoodModule({name:"Sekiro", price:"24.99", image:$r("app.media.sekiro")}))
  listData.push(new GoodModule({name:"审判之逝", price:"24.99", image:$r("app.media.lostJudgement")}))
  listData.push(new GoodModule({name:"死亡搁浅", price:"24.99", image:$r("app.media.DS")}))

  return listData
}
