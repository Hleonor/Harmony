import { Student, SystemManager } from '../Student'

@Entry
@Component
struct Index
{
  @State message: string = ''
  @State count: number = 10
  @State student: Student = new Student("Sekiro", 10)

  @State manager : SystemManager = new SystemManager("管理系统", new Student("Naked Snake", 98))

  @Provide("test") aNUMBER:number = 6

  build()
  {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center })
    {
      Column()
      {
        Text(this.count + '')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() =>
          {
            this.count++;
            this.student.age++
            this.student.userName = "iShin"
          })

      }
      // MyButton({count:this.count})
      MyButton({ count: $count, student: this.manager.student }) // @link

      Text("当前数据为：" + this.aNUMBER)
        .fontWeight(FontWeight.Bold)
        .fontSize(30)
        .onClick(()=>
        {
          this.aNUMBER++
        })
        .fontColor(Color.Blue)
    }
    .height('100%')

  }
}

// 需求：父组件的数据改变，自动同步到子组件上
// @Prop 装饰器作用，父组件数据改变会单向同步到子组件
// @Link student: Student，支持复杂类型，
// 双向绑定
@Component
struct MyButton
{
  // @Prop count: number，prop不支持复杂类型
  @Link count: number
  // @Link student: Student，支持复杂类型，
  @ObjectLink student: Student

  @Consume("test") Anumber: number

  constructor(count: number, student: Student)
  {
    super()
    this.count = count
    this.student = student
  }

  build()
  {
    Column()
    {
      Button("按钮" + this.count + " " + this.student.userName + " " + this.student.age)
        .onClick(() =>
        {
          this.count++;
          this.student.age++;
        })
        .fontSize(20)

      ThirdCom({ count: this.count })

      Text("子组件的数据为:" + this.Anumber)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .onClick(()=>
        {
          this.Anumber++
        })
        .margin(10)

    }
  }
}

@Component
struct ThirdCom
{
  @Prop count: number

  constructor(count: number)
  {
    super()
    this.count = count
  }

  build()
  {
    Text("第三个组件" + this.count)
      .fontColor(Color.Red)
      .fontSize(20)
      .onClick(() =>
      {
        this.count++
      })

  }
}
