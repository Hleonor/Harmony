export class WeatherReportModule
{
  lives: Array<WeatherDetail>
}

export class WeatherDetail
{
  province:string
  city:string
  weather:string
  temperature:string
  windpower:string
  temperature_float:string
  humidity:string
  reporttime:string
}