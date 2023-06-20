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
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))
  listData.push(new GoodModule({name:"Devil May Cry", price:"24.99", image:$r("app.media.cartSelect")}))

  return listData
}
