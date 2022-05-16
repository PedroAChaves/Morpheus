const express = require('express')
const multer = require('multer')
const cors = require('cors')
const fs = require('fs')

const upload = multer({ dest: 'uploads/' })

const app = express()
app.use(cors())
app.use('/static', express.static('uploads'))

app.post('/upload', upload.single('avatar'), function (req, res) {
  console.log('Received file' + req.file.originalname)
  const src = fs.createReadStream(req.file.path)
  const dest = fs.createWriteStream('uploads/' + req.file.originalname)
  src.pipe(dest)
  src.on('end', function () {
    fs.unlinkSync(req.file.path)
    res.json({ file_url: 'http://localhost:8080/static/' + req.file.originalname })
  })
  src.on('error', function (err) {
    res.json('Something went wrong!')
  })
})

app.listen(8080, () => console.log('Started file upload server'))
