@Observed
export class Student
{
  userName: string
  age: number

  constructor(userName: string, age: number)
  {
    this.userName = userName
    this.age = age
  }
}

export class SystemManager
{
  public name : string
  student: Student

  constructor(name: string, student:Student)
  {
    this.name = name
    this.student = student
  }
}
