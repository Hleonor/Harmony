@Entry
@Component
export struct Test
{
  @State message: string = 'Hello World'

  build()
  {
    Row()
    {
      Column()
      {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
// export default Test