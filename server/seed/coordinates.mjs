function getCoordinateInRadius(center, radius) {
  var y0 = center.latitude
  var x0 = center.longitude
  var rd = radius / 111300

  var u = Math.random()
  var v = Math.random()

  var w = rd * Math.sqrt(u)
  var t = 2 * Math.PI * v
  var x = w * Math.cos(t)
  var y = w * Math.sin(t)

  var xp = x / Math.cos(y0)

  return { latitude: y + y0, longitude: xp + x0 }
}

console.log(getCoordinateInRadius({ latitude: -23.187294688664764, longitude: -46.89372471689559 }, 8000));