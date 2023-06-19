import { Student } from '../Student'
@Entry
@Component
struct Index
{
  @State message: string = ''
  @State count: number = 10

  @State student:Student = new Student("Sekiro", 10)

  build()
  {
    Row()
    {
      Column()
      {
        Text(this.count + '')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>
          {
            this.count++;
            this.student.age++
          })

      }
      // MyButton({count:this.count})
      MyButton({count:$count, student:$student}) // @link
    }
    .height('100%')
  }
}

// 需求：父组件的数据改变，自动同步到子组件上
// @Prop 装饰器作用，父组件数据改变会单向同步到子组件
// 双向绑定
@Component
struct MyButton
{
  // @Prop count: number
  @Link count:number
  @Link student:Student

  constructor(count: number, student:Student)
    {
      super()
      this.count = count
      this.student = student
    }

  build()
  {
    Column()
    {
      Button("自定义控件" + this.count + " " + this.student.userName + " " + this.student.age)
        .onClick(()=>
        {
          this.count++;
          this.student.age++;
        })

      ThirdCom({count:this.count})
    }
  }
}

@Component
struct ThirdCom
{
  @Prop count:number

  constructor(count:number)
    {
      super()
      this.count = count
    }
  build()
  {
    Text("第三个组件" + this.count)
      .fontColor(Color.Red)
      .fontSize(20)
      .onClick(()=>
      {
        this.count++
      })

  }
}
