@Entry
@Component
export struct CanvasPage {
  @State message: string = 'Hello World'
  settings: RenderingContextSettings = new RenderingContextSettings(true)
  paint: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  startx: number
  starty: number
  endx: number
  endy: number

  build()
  {
    Flex({direction:FlexDirection.Column, alignItems:ItemAlign.Center, justifyContent:FlexAlign.SpaceBetween})
    {
      Canvas(this.paint)
      {

      }
      .backgroundColor(Color.White)
      .onReady(() =>
      {
        /*// 线条样式
        this.paint.strokeStyle="#ff005eff"
        // 线条宽度
        this.paint.lineWidth = 10
        // 绘制
        this.paint.strokeRect(100,100,100,100)

        // 绘制
        this.paint.stroke()

        // 设置填充的颜色
        this.paint.fillStyle = "#ffff0000"
        // 设置填充的颜色
        this.paint.fillRect(200, 200, 100, 100)

        this.paint.moveTo(100, 100)
        this.paint.lineTo(300, 300)
        this.paint.stroke()*/


      })
      .onTouch((event) =>
      {
        switch (event.type)
        {
          case TouchType.Down:
            console.info(JSON.stringify(event))
          // 获取手指摁下的坐标
            this.startx = event.touches[0].screenX
            this.starty = event.touches[0].screenY

          /*this.points = []*/
            break
          case TouchType.Move:
            this.endx = event.touches[0].screenX
            this.endy = event.touches[0].screenY
            this.drawBerizer(this.endx, this.endy)
            break

          case TouchType.Up:
            this.points = []
            break
        }
      })
      .height("100%")
      .width("100%")

      this.bottom()
    }
  }

  draw()
  {
    /*this.paint.strokeStyle = "#ff00fff7"*/
    this.paint.globalCompositeOperation = 'destination-over'
    this.paint.lineWidth = 10
    this.paint.moveTo(this.startx, this.starty)
    this.paint.lineTo(this.endx, this.endy)
    this.startx = this.endx
    this.starty = this.endy
    this.paint.stroke()
  }

  points = []

  drawBerizer(movex, movey)
  {
    this.paint.globalCompositeOperation = 'destination-over'
    /*this.paint.strokeStyle = "#FF00FFF7"*/
    this.paint.lineWidth = 10
    this.points.push(
      {
        x: movex,
        y: movey
      }
    )

    let pointLen = this.points.length

    if (pointLen <= 2)
    {
      this.draw()
    }
    else
    {
      let endx = (this.points[pointLen - 1].x + this.points[pointLen - 2].x) / 2
      let endy = (this.points[pointLen - 1].y + this.points[pointLen - 2].y) / 2

      let lastX = (this.points[pointLen - 2].x + this.points[pointLen - 3].x) / 2
      let lastY = (this.points[pointLen - 2].y + this.points[pointLen - 3].y) / 2
      this.paint.moveTo(lastX, lastY)

      let cpx = this.points[pointLen - 2].x
      let cpy = this.points[pointLen - 2].y

      // 绘制平滑的曲线
      this.paint.quadraticCurveTo(cpx, cpy, endx, endy)

      this.paint.stroke()
    }
  }

  @Builder bottom()
  {
    Flex({direction:FlexDirection.Row})
    {
      Circle()
        .fill("#ff0000")
        .height(60)
        .width(60)
        .onClick(()=>
        {
          this.paint.strokeStyle = "#ff0000"
        })
        .height(30)
        .width(30)

      Circle()
        .fill("#ff0048ff")
        .height(60)
        .width(60)
        .onClick(()=>
        {
          this.paint.strokeStyle = "#ff0048ff"
        })
        .height(30)
        .width(30)

      Circle()
        .fill("#ffff8c00")
        .height(60)
        .width(60)
        .onClick(()=>
        {
          this.paint.strokeStyle = "#ffff8c00"
        })
        .height(30)
        .width(30)

      Button("清理画板").onClick(()=>
      {
        this.paint.clearRect(0, 0, 1000, 1000)
        this.paint.beginPath()
      })

    }.backgroundColor("#ffe5e4e4")
    .padding(10)
  }
}
