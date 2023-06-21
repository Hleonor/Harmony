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
  listData.push(new CenterModule("动作冒险", $r("app.media.Mario")))
  listData.push(new CenterModule("枪战射击", $r("app.media.HalfLife")))
  listData.push(new CenterModule("休闲养成", $r("app.media.Pokemon")))
  listData.push(new CenterModule("恐怖血腥", $r("app.media.skull")))
  listData.push(new CenterModule("独立游戏", $r("app.media.playstation")))
  listData.push(new CenterModule("主机专区", $r("app.media.nintendo")))
  listData.push(new CenterModule("棋牌娱乐", $r("app.media.Sonic")))
  listData.push(new CenterModule("角色扮演", $r("app.media.BomberMan")))
  listData.push(new CenterModule("模拟经营", $r("app.media.Arcade")))
  listData.push(new CenterModule("体育竞技", $r("app.media.Pong")))
  return listData
}