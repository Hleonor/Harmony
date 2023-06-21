@Entry
@Component
struct CanvasPage
{
  @State message: string = 'Hello World'

  settings:RenderingContextSettings = new RenderingContextSettings(true)
  paint:CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  startx : number
  starty : number
  endx : number
  endy : number

  build()
  {
    Canvas(this.paint)
    {

    }.backgroundColor(Color.Pink)
    .onReady(()=>
    {



    })
    .onTouch((event)=>
    {
      switch (event.type)
      {
        case TouchType.Down:
          console.info(JSON.stringify(event))
          // 获取手指摁下的坐标
          this.startx = event.touches[0].screenX
          this.starty = event.touches[0].screenY
          break
        case TouchType.Move:
          this.endx = event.touches[0].screenX
          this.endy = event.touches[0].screenY
          this.draw()
          break
      }
    })
    .height("100%")
    .width("100%")
  }

  draw()
  {
    this.paint.strokeStyle = "#ff0000"
    this.paint.lineWidth = 10
    this.paint.moveTo(this.startx, this.starty)
    this.paint.lineTo(this.endx, this.endy)
    this.startx = this.endx
    this.starty = this.endy
    this.paint.stroke()
  }
}
